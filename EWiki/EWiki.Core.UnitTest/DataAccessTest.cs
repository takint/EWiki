using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using EWiki.Api.Models;
using System.Linq;
using Aspose.Cells;

namespace EWiki.UnitTest
{
    [TestClass]
    public class DataAccessTest
    {
        private EWikiEntities _dbContext;

        [TestMethod]
        public void ImportData()
        {
            //ImportTypes();
            //ImportMoves();
            //ImportLocation();
            //ImportPokedex();
        }

        [TestInitialize]
        public void Initial()
        {
            _dbContext = new EWikiEntities();
        }

        private void ImportTypes()
        {
            LoadOptions loadOptions = new LoadOptions(LoadFormat.CSV);
            Workbook csvPokedexType = new Workbook("..//Types.csv", loadOptions);

            if (csvPokedexType != null)
            {
                List<Category> types = new List<Category>();
                int sheetIndex = csvPokedexType.Worksheets.ActiveSheetIndex;
                int rows = csvPokedexType.Worksheets[sheetIndex].Cells.Rows.Count;
                Cells typeData = csvPokedexType.Worksheets[sheetIndex].Cells;

                for (int row = 1; row <= rows - 1; row++)
                {
                    Category type = new Category()
                    {
                        CatPages = 1,
                        CatTitle = typeData.GetCell(row, 1).StringValue,
                        CatTitleVI = typeData.GetCell(row, 2).StringValue,
                        CreatedDate = DateTime.Now
                    };

                    types.Add(type);
                }

                _dbContext.Categories.AddRange(types);
                _dbContext.SaveChanges();
            }
        }

        private void ImportMoves()
        {
            LoadOptions loadOptions = new LoadOptions(LoadFormat.Xlsx);
            Workbook csvPokedexMoves = new Workbook("..//Moves.csv", loadOptions);

            if (csvPokedexMoves != null)
            {
                List<Move> moves = new List<Move>();
                int sheetIndex = csvPokedexMoves.Worksheets.ActiveSheetIndex;
                int rows = csvPokedexMoves.Worksheets[sheetIndex].Cells.Rows.Count;
                Cells moveData = csvPokedexMoves.Worksheets[sheetIndex].Cells;

                for (int row = 1; row <= rows - 1; row++)
                {
                    Move move = new Move()
                    {
                        Name = moveData.GetCell(row, 1).StringValue,
                        Power = float.Parse(moveData.GetCell(row, 3).StringValue),
                        Cooldown = float.Parse(moveData.GetCell(row, 4).StringValue),
                        Energy = int.Parse(moveData.GetCell(row, 5).StringValue),
                        DPS = float.Parse(moveData.GetCell(row, 7).StringValue),
                        WithSTAB = float.Parse(moveData.GetCell(row, 8).StringValue),
                        CritChange = float.Parse(moveData.GetCell(row, 9).StringValue),
                        CreatedDate = DateTime.Now
                    };

                    moves.Add(move);
                }

                _dbContext.Moves.AddRange(moves);
                _dbContext.SaveChanges();
            }
        }

        private void ImportLocation()
        {
            LoadOptions loadOptions = new LoadOptions(LoadFormat.CSV);
            Workbook csvPokedexLocations = new Workbook("..//Location.csv", loadOptions);

            if (csvPokedexLocations != null)
            {
                List<Location> locations = new List<Location>();
                int sheetIndex = csvPokedexLocations.Worksheets.ActiveSheetIndex;
                int rows = csvPokedexLocations.Worksheets[sheetIndex].Cells.Rows.Count;
                Cells locationData = csvPokedexLocations.Worksheets[sheetIndex].Cells;

                for (int row = 1; row <= rows - 1; row++)
                {
                    Location location = new Location()
                    {
                        Name = locationData.GetCell(row, 2) != null ? locationData.GetCell(row, 2).StringValue : string.Empty,
                        Description = locationData.GetCell(row, 3) != null ? locationData.GetCell(row, 3).StringValue : string.Empty,
                        CreatedDate = DateTime.Now
                    };

                    locations.Add(location);
                }

                _dbContext.Locations.AddRange(locations);
                _dbContext.SaveChanges();
            }
        }

        private void ImportPokedex()
        {
            LoadOptions loadOptions = new LoadOptions(LoadFormat.CSV);
            Workbook csvPokedexPokedex = new Workbook("..//Pokedex.csv", loadOptions);

            if (csvPokedexPokedex != null)
            {
                List<Character> pokemons = new List<Character>();
                int sheetIndex = csvPokedexPokedex.Worksheets.ActiveSheetIndex;
                int rows = csvPokedexPokedex.Worksheets[sheetIndex].Cells.Rows.Count;
                Cells pokemonData = csvPokedexPokedex.Worksheets[sheetIndex].Cells;

                for (int row = 1; row <= rows - 1; row++)
                {
                    List<Category> types = new List<Category>();
                    string[] typesInData = pokemonData.GetCell(row, 2).StringValue.Split(',');
                    foreach (string type in typesInData)
                    {
                        types.Add(_dbContext.Categories.FirstOrDefault(c => c.CatTitle == type));
                    }

                    List<Move> normalMoves = new List<Move>();
                    string[] moveInData = pokemonData.GetCell(row, 13).StringValue.Split(',');
                    foreach (string move in moveInData)
                    {
                        normalMoves.Add(_dbContext.Moves.FirstOrDefault(c => c.Name == move));
                    }

                    List<Move> specialMoves = new List<Move>();
                    string[] specialMoveInData = pokemonData.GetCell(row, 14).StringValue.Split(',');
                    foreach (string move in specialMoveInData)
                    {
                        specialMoves.Add(_dbContext.Moves.FirstOrDefault(c => c.Name == move));
                    }

                    Character pokemon = new Character()
                    {
                        Number = pokemonData.GetCell(row, 0).StringValue,
                        Name = pokemonData.GetCell(row, 1).StringValue,
                        Slug = pokemonData.GetCell(row, 1).StringValue.ToLower(),
                        Species = pokemonData.GetCell(row, 3).StringValue,
                        Description = pokemonData.GetCell(row, 4) != null ? pokemonData.GetCell(row, 4).StringValue : string.Empty,
                        Weight = float.Parse(pokemonData.GetCell(row, 5).StringValue),
                        Height = float.Parse(pokemonData.GetCell(row, 6).StringValue),
                        Stamina = int.Parse(pokemonData.GetCell(row, 7).StringValue),
                        Attack = int.Parse(pokemonData.GetCell(row, 8).StringValue),
                        Defense = int.Parse(pokemonData.GetCell(row, 9).StringValue),
                        Candy = pokemonData.GetCell(row, 10) != null ? int.Parse(pokemonData.GetCell(row, 10).StringValue) : 0,
                        CPGain = float.Parse(pokemonData.GetCell(row, 11).StringValue),
                        MaxCP = int.Parse(pokemonData.GetCell(row, 12).StringValue),
                        Moves = normalMoves,
                        Moves1 = specialMoves,
                        EvolveFromId = 0,
                        EvolveIntos = pokemonData.GetCell(row, 16) != null ? pokemonData.GetCell(row, 16).StringValue : string.Empty,
                        CreatedDate = DateTime.Now
                    };
                    pokemons.Add(pokemon);
                }

                _dbContext.Characters.AddRange(pokemons);
                _dbContext.SaveChanges();
            }
        }
    }
}
