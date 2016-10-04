using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Service.Models;

namespace EWiki.XF.Service.IVCalculator
{
    public class Calculator
    {
        public static CalculateResult Calculate(PokemonSM pokemon, int cp, int hp, int trainerLvl, int pokemonLvl = 0, int stardust = 0, bool powered = false)
        {
            // Source: https://github.com/andromedado/pokemon-go-iv-calculator/blob/master/index.js
            // Website to test:
            // https://pokemon.gameinfo.io/en/tools/iv-calculator
            // https://pokeassistant.com/main/ivcalculator

            List<LevelData> potentialLevels = new List<LevelData>();
            List<HPIV> potentialHPIVs = new List<HPIV>();
            List<IVDetail> potentialIVs = new List<IVDetail>();
            IVResult ivResult = new IVResult();
            List<LevelData> levels = new LevelData().GetLevels();

            if (stardust == 0)
            {
                potentialLevels = levels.Where(l => l.Level == pokemonLvl).ToList();
                if (potentialLevels == null)
                {
                    return new CalculateResult()
                    {
                        Status = Status.InvalidInput,
                        Message = "Invalid pokemon's level"
                    };
                }
            }
            else if (pokemonLvl == 0)
            {
                potentialLevels = levels.Where(l => l.Stardust == stardust).ToList();
                if (potentialLevels == null)
                {
                    return new CalculateResult()
                    {
                        Status = Status.InvalidInput,
                        Message = "Invalid stardust number"
                    };
                }
            }
            else
            {
                return new CalculateResult()
                {
                    Status = Status.InvalidInput,
                    Message = "Invalid input"
                };
            }

            potentialLevels.RemoveAll(l => l.Level > (trainerLvl + 2));
            if (potentialLevels == null)
            {
                return new CalculateResult()
                {
                    Status = Status.InvalidInput,
                    Message = "Invalid trainer's level"
                };
            }

            if (!powered)
            {
                potentialLevels.RemoveAll(level => level.Level % 1 != 0);
            }

            foreach (var level in potentialLevels)
            {
                for (int stamina = 0; stamina <= 15; stamina++)
                {
                    if (VerifyHP(hp, stamina, level, pokemon))
                    {
                        potentialHPIVs.Add(new HPIV()
                        {
                            Stamina = stamina,
                            Level = level
                        });
                    }
                }
            }

            foreach (var hpIV in potentialHPIVs)
            {
                for (int attack = 0; attack <= 15; attack++)
                {
                    for (int defense = 0; defense <= 15; defense++)
                    {
                        if (VerifyCP(cp, attack, defense, hpIV.Stamina, hpIV.Level, pokemon))
                        {
                            var iv = ((double)(attack + defense + hpIV.Stamina) / (double)45) * 100;
                            potentialIVs.Add(new IVDetail()
                            {
                                IV = Math.Round(iv, 2),
                                Attack = attack,
                                Defense = defense,
                                Stamina = hpIV.Stamina,
                                Level = hpIV.Level.Level,
                                Grade = Grader(iv)
                            });
                        }
                    }
                }
            }

            if (potentialIVs.Count == 0)
            {
                return new CalculateResult()
                {
                    Status = Status.Error,
                    Message = "Could not find any IVs matching the given information"
                };
            }

            if (potentialIVs.Count > 100)
            {
                return new CalculateResult()
                {
                    Status = Status.Success,
                    Message = "Too many combinations. Please level up you pokemon to get more accurate result."
                };
            }

            var bestIV = potentialIVs.OrderByDescending(iv => iv.IV).First();
            var averageIVPercent = potentialIVs.Sum(iv => iv.IV) / potentialIVs.Count;
            var averageBRPercent = (double)(potentialIVs.Sum(iv => iv.Attack) + potentialIVs.Sum(iv => iv.Defense)) * 100 / ((double)30 * potentialIVs.Count);
            var averageHPPercent = (double)potentialIVs.Sum(iv => iv.Stamina) * 100 / ((double)15 * potentialIVs.Count);
            ivResult.CPRating = Math.Round(bestIV.IV);
            ivResult.CPRatingFromAvg = Math.Round(ivResult.CPRating - averageIVPercent);
            ivResult.BattleRating = Math.Round(((double)(bestIV.Attack + bestIV.Defense) / (double)30) * 100);
            ivResult.BattleRatingFromAvg = Math.Round(ivResult.BattleRating - averageBRPercent);
            ivResult.HPRating = Math.Round(((double)bestIV.Stamina / (double)15) * 100);
            ivResult.HPRatingFromAvg = Math.Round(ivResult.HPRating - averageHPPercent);
            ivResult.Grade = Grader(ivResult.CPRating);
            ivResult.Details = potentialIVs;

            return new CalculateResult()
            {
                Status = Status.Success,
                IVResult = ivResult
            };
        }

        private static bool VerifyHP(int hp, int staminaIV, LevelData levelData, PokemonSM pokemon)
        {
            return hp == Convert.ToInt32(Math.Floor((pokemon.Stamina + staminaIV) * levelData.CPScalar));
        }

        private static bool VerifyCP(int cp, int attack, int defense, int stamina, LevelData levelData, PokemonSM pokemon)
        {
            var attackFactor = pokemon.Attack + attack;
            var defenseFactor = Math.Pow(pokemon.Defense + defense, 0.5);
            var staminaFactor = Math.Pow(pokemon.Stamina + stamina, 0.5);
            var scalarFactor = Math.Pow(levelData.CPScalar, 2);
            return cp == Convert.ToInt32(attackFactor * defenseFactor * staminaFactor * scalarFactor / 10);
        }

        public static Grade Grader(double IV)
        {
            if (IV < 49)
            {
                return Grade.Bad;
            }
            if (IV < 64.5)
            {
                return Grade.Average;
            }
            if (IV < 80.1)
            {
                return Grade.Good;
            }
            if (IV < 100)
            {
                return Grade.VeryGood;
            }
            return Grade.Excellent;
        }
    }
}
