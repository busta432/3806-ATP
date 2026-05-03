import random
import os

def generate_fol_dataset(count=500):
    predicates = ['P', 'Q', 'R', 'S', 'T', 'A', 'B', 'C']
    vars_list = ['x', 'y', 'z', 'w']
    dataset = []

    for i in range(1, count + 1):
        if i <= 150: # Easy
            diff = "Easy"
            p1, p2 = random.sample(predicates, 2)
            templates = [
                f"∀x. ({p1}(x) → {p2}(x))",
                f"∃x. ({p1}(x) ∧ {p2}(x))",
                f"∀x. (¬{p1}(x) ∨ {p2}(x))",
                f"¬∃x. ({p1}(x) ∧ ¬{p2}(x))"
            ]
            formula = random.choice(templates)
        
        elif i <= 350: # Medium
            diff = "Medium"
            p1, p2 = random.sample(predicates, 2)
            rel = "R"
            templates = [
                f"∀x. ∃y. {rel}(x, y)",
                f"∀x. ({p1}(x) → ∃y. ( {p2}(y) ∧ {rel}(x, y) ))",
                f"∃x. ∀y. ({rel}(x, y) ↔ {rel}(y, x))",
                f"∀x. ∀y. ({rel}(x, y) → ({p1}(x) ∧ {p1}(y)))"
            ]
            formula = random.choice(templates)

        else: # Hard
            diff = "Hard"
            p1, p2, p3 = random.sample(predicates, 3)
            rel = "R"
            templates = [
                f"∀x. ∃y. ∀z. ({rel}(x, y) ∧ {rel}(y, z) → {rel}(x, z))",
                f"∀x. ({p1}(x) ↔ ∃y. ({p2}(y) ∧ ∀z. ({rel}(y, z) → {p3}(z))))",
                f"∃x. (∀y. {rel}(x, y) ∧ ¬∃z. ({p1}(z) ∧ {rel}(z, x)))",
                f"∀x. ∀y. ∀z. ({p1}(x, y, z) → ({p2}(x) ∨ {p3}(y)))"
            ]
            formula = random.choice(templates)

        dataset.append({"id": i, "difficulty": diff, "formula": formula})
    
    return dataset

if __name__ == "__main__":
    random.seed(42)  # For reproducibility
    data = generate_fol_dataset(500)
    # Ensure test directory exists
    os.makedirs("test", exist_ok=True)
    with open("test/random_benchmark.txt", "w", encoding="utf-8") as f:
        for item in data:
            f.write(f"{item['id']}|{item['difficulty']}|{item['formula']}\n")
    print("Generated 500 problems in test/random_benchmark.txt")
