using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using EWiki.Api.Models;
using EWiki.Api.DataAccess;
using Microsoft.DotNet.InternalAbstractions;

namespace EWiki.Api.Controllers
{
    [Route("api/[controller]")]
    public class ImportController : Controller
    {
        private readonly IPokedexRepository pokedexRepository;
        private readonly ICategoryRepository categoryRepository;
        private readonly IMoveRepository moveRepository;
        private readonly ILocationRepository locationRepository;

        public ImportController(
            IPokedexRepository pokedexRepo,
            ICategoryRepository categoryRepo,
            IMoveRepository moveRepo,
            ILocationRepository locationRepo)
        {
            pokedexRepository = pokedexRepo;
            categoryRepository = categoryRepo;
            moveRepository = moveRepo;
            locationRepository = locationRepo;
        }

        [HttpGet("Import")]
        public void Import()
        {
            ImportTypes();
            ImportMoves();
            ImportLocation();
            ImportPokedex();
        }

        private void ImportTypes()
        {
            Chilkat.Csv csv = new Chilkat.Csv();
            csv.HasColumnNames = true;

            bool success = csv.LoadFile(ApplicationEnvironment.ApplicationBasePath + "\\Types.csv");
            if (success != true)
            {
                Console.WriteLine(csv.LastErrorText);
            }

            List<Category> types = new List<Category>();
            int rows = csv.NumRows;
            for (int row = 0; row <= rows - 1; row++)
            {
                Category type = new Category()
                {
                    CatTitle = csv.GetCell(row, 1),
                    CatTitleVI = csv.GetCell(row, 2),
                };

                types.Add(type);
            }

            categoryRepository.AddRange(types);
            categoryRepository.Commit();
        }

        private void ImportMoves()
        {
            Chilkat.Csv csv = new Chilkat.Csv();
            csv.HasColumnNames = true;

            bool success = csv.LoadFile(ApplicationEnvironment.ApplicationBasePath + "\\Moves.csv");
            if (success != true)
            {
                Console.WriteLine(csv.LastErrorText);
            }

            List<Move> moves = new List<Move>();
            int rows = csv.NumRows;
            for (int row = 0; row <= rows - 1; row++)
            {
                Move move = new Move()
                {
                    Name = csv.GetCell(row, 1),
                    Type = csv.GetCell(row, 2),
                    Power = float.Parse(csv.GetCell(row, 3)),
                    Cooldown = float.Parse(csv.GetCell(row, 4)),
                    Energy = int.Parse(csv.GetCell(row, 5)),
                    Category = csv.GetCell(row, 6),
                    DPS = float.Parse(csv.GetCell(row, 7)),
                    WithSTAB = float.Parse(csv.GetCell(row, 8)),
                    CritChange = float.Parse(csv.GetCell(row, 9)),
                };

                moves.Add(move);
            }

            moveRepository.AddRange(moves);
            moveRepository.Commit();
        }

        private void ImportLocation()
        {
            Chilkat.Csv csv = new Chilkat.Csv();
            csv.HasColumnNames = true;

            bool success = csv.LoadFile(ApplicationEnvironment.ApplicationBasePath + "\\Types.csv");
            if (success != true)
            {
                Console.WriteLine(csv.LastErrorText);
            }

            List<Location> locations = new List<Location>();
            int rows = csv.NumRows;
            for (int row = 0; row <= rows - 1; row++)
            {
                Location location = new Location()
                {
                    Type = csv.GetCell(row, 1),
                    Name = csv.GetCell(row, 2),
                    Description = csv.GetCell(row, 3),
                };

                locations.Add(location);
            }

            locationRepository.AddRange(locations);
            locationRepository.Commit();
        }

        private void ImportPokedex()
        {
            Chilkat.Csv csv = new Chilkat.Csv();
            csv.HasColumnNames = true;

            bool success = csv.LoadFile(ApplicationEnvironment.ApplicationBasePath + "\\Pokedex.csv");
            if (success != true)
            {
                Console.WriteLine(csv.LastErrorText);
            }

            // Enocde to display VNese
            //Chilkat.Mime mime = new Chilkat.Mime();
            //mime.Charset = "utf-8";
            //mime.ContentType = "text/plain";
            //mime.SetBody(csv.GetCell(0, 4));
            //var a = mime.GetBodyEncoded();

            //byte[] bytes = Encoding.UTF8.GetBytes(csv.GetCell(0, 4));
            //var myString = Encoding.Unicode.GetString(bytes);

            List<Character> pokemons = new List<Character>();
            int rows = csv.NumRows;
            for (int row = 0; row <= rows - 1; row++)
            {
                List<Category> types = new List<Category>();
                foreach(string type in csv.GetCell(row, 2).Split(',').ToList())
                {
                    types.Add(categoryRepository.FindBy(c => c.CatTitle == type).FirstOrDefault());
                }

                List<Move> normalMoves = new List<Move>();
                foreach (string move in csv.GetCell(row, 13).Split(',').ToList())
                {
                    normalMoves.Add(moveRepository.FindBy(c => c.Name == move).FirstOrDefault());
                }

                List<Move> specialMoves = new List<Move>();
                foreach (string move in csv.GetCell(row, 14).Split(',').ToList())
                {
                    specialMoves.Add(moveRepository.FindBy(c => c.Name == move).FirstOrDefault());
                }

                Character pokemon = new Character()
                {
                    Number = csv.GetCell(row, 0),
                    Name = csv.GetCell(row, 1),
                    Types = types,
                    Species = csv.GetCell(row, 3),
                    Description = csv.GetCell(row, 4),
                    Weight = float.Parse(csv.GetCell(row, 5)),
                    Height = float.Parse(csv.GetCell(row, 6)),
                    Stamina = int.Parse(csv.GetCell(row, 7)),
                    Attack = int.Parse(csv.GetCell(row, 8)),
                    Defense = int.Parse(csv.GetCell(row, 9)),
                    Candy = int.Parse(csv.GetCell(row, 10)),
                    CPGain = float.Parse(csv.GetCell(row, 11)),
                    MaxCP = int.Parse(csv.GetCell(row, 12)),
                    NormalMoves = normalMoves,
                    SpecialMoves = specialMoves,
                    EvolveFrom = pokedexRepository.FindBy(p => p.Number == csv.GetCell(row, 15)).FirstOrDefault(),
                    EvolveIntos = csv.GetCell(row, 16),
                };

                pokemons.Add(pokemon);
            }

            pokedexRepository.AddRange(pokemons);
            pokedexRepository.Commit();
        }
    }
}
