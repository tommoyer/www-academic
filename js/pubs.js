function bibtex_js_draw() {

$(".bibtex_template").hide();
(new BibtexDisplay()).displayBibtex($("#bibtex_input").val(), $("#bibtex_display"));
}
$(document).ready( function() {

$("#bibtex_input").load( "files/pubs.bib", bibtex_js_draw );
} );
