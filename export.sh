read -p "Folder path: " npath
read -p "Notebook name: " notebook
jupyter nbconvert $npath/$notebook.ipynb --execute --allow-errors --output-dir $npath --to markdown --template temp.tpl --ExecutePreprocessor.timeout=500 --NbConvertApp.output_files_dir=.
cat $npath/$notebook.md | tee -a $npath/index.mmark
rm $npath/$notebook.md
