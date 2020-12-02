# Advent of Code

A quick little framework to bootstrap and run AOC problems.

## Usage

### Bootstrapping a Day

The files needed for a day will be bootstrapped by the command `pub run bin/new <day_num>` (for some reason pub isn't working as expected and so you need the "bin" piece).  This command does a number of things: creates 2 [input files](#inputs), creates and populates a [solution file](#solutions), creates a test file, and bootstraps the solution file to the runner.

#### Input Files

I forget if there will always be the same data-set for the two parts of each day or not, so inputs require that you populate both files for a day.  The files should be named in the format `<day>-<part>.json`.

#### Solution Files

The solution file is bootstrapped into a folder by the name of the day number.  If you are looking for day one, you would look in [](lib/src/one/one.dart).

The solution file expects three pieces:

- argument serializer for part 1
- argument serializer for part 2
- a Day class containing
  - argument mapper/reducer for part 1
  - solution for part 1
  - argument mapper/reducer for part 2
  - solution for part 2

#### Test Files

Test files are much like solution files, except that they are in the `test` directory rather than the `lib` directory.  

_Note: At this time, testing has not been officially configured for this codebase._

### Running a Day

You can run a day using the input files as input by using the command `pub run bin/day <day_num> <day_part>`.
