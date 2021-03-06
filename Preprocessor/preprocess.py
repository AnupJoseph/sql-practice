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
    r"C:\Users\Anup Joseph\Anup\Core DS\SQL\Questions\interviewqs\Fraudulent_Retail_Accounts\shopify_store_account.sql",
    table_name="shopify_store_account",
    cols=["id", "date", "status", "revenue"],
    dataset="interviewqs",
)
