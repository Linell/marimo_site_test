import marimo

__generated_with = "0.1.88"
app = marimo.App()


@app.cell
def __():
    import marimo as mo

    mo.md("""
     # It's Alive! But Lamer this time!

     This page is an experiment in how easy it is to create and deploy custom reports using [marimo](https://marimo.io/), which is an open-source reactive notebook for Python. It lets you do all sorts of neat stuff.
    """)
    return mo,


if __name__ == "__main__":
    app.run()
