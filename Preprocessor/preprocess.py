from typing import List


def processor(
    filename: str,
    table_name: str = "employees",
    dataset: str = "easy_question_datasets",
    cols: List[str] = None,
):
    with open(filename) as infile:
        query = infile.read()
        correct_table_name = f"`ringed-bond-261712.{dataset}.{table_name}`"
        columns = ", ".join(cols)
        str_to_replace = f"insert into {table_name} ({columns}) values"
        correct_str = f"insert into {correct_table_name}  ({columns}) values"
        print(f"{str_to_replace=}")
        print(f"{correct_str=}")
        query = query.replace(str_to_replace, correct_str, 1)
        query = query.replace(str_to_replace, "")
        query = query.replace(");", "),")
        query = query.replace("VARCHAR", "STRING")

    with open(f"""{filename.replace(".sql","")}-corrected.sql""", "w") as outfile:
        outfile.write(query)


processor(
    r"C:\Users\Anup Joseph\Anup\Core DS\SQL\Questions\hard_datasets\Subscription_Overlap\subscriptions.sql",
    table_name="subscriptions",
    cols=["id", "start_date", "end_date"],
    dataset="hard_questions_dataset",
)
