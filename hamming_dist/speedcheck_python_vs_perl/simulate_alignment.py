import argparse
import random


def main():
    args = parse_args()

    with open(args.outfile, "w") as f:
        bases = ["A", "C", "T", "G"]
        for i in range(args.n):
            f.write(">Seq_" + str(i) + "\n")
            f.write("".join(random.choices(bases, k=args.m)) + "\n")


def parse_args():
    parser = argparse.ArgumentParser(description="Simulate an alignment.")
    parser.add_argument(
        "-o",
        "--outfile",
        default="simulated.fasta",
        help="Name of file to write alignment to.",
    )
    parser.add_argument(
        "-n",
        type=int,
        default=10,
        help="Number of sequences to simulate (default: 10).",
    )
    parser.add_argument(
        "-m",
        type=int,
        default=30000,
        help="Alignment length to simulate (default: 30000).",
    )
    return parser.parse_args()


if __name__ == "__main__":
    main()
