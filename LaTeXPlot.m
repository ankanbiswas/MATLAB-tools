function LaTeXPlot(export_name, figure_handle)

if nargin > 1
    h = figure_handle;
else
    h = gcf;
end

matlab2tikz('filename',[export_name, '.tikz'], 'figurehandle',h, 'height','\figureheight', 'width','\figurewidth', 'showInfo',false, 'interpretTickLabelsAsTex',false);

tex_code = [...
    '\n\\begin{figure}', ...
    '\n\t\\centering',...
    '\n\t\\newlength\\figureheight', ...
	'\n\t\\newlength\\figurewidth', ...
	'\n\t\\setlength\\figureheight{\\textwidth}', ...
	'\n\t\\setlength\\figurewidth{\\textwidth}', ...
	'\n\t\\input{', export_name, '.tikz}', ...
	'\n\t\\caption{\\label{fig:}}',...
	'\n\\end{figure}\n\n'];

fprintf(tex_code);

clipboard('copy', sprintf(tex_code))

end