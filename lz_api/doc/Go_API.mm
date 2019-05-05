<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Go API" FOLDED="false" ID="ID_589159613" CREATED="1557085032286" MODIFIED="1557085055442" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.5">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="6" RULE="ON_BRANCH_CREATION"/>
<node TEXT="upload" POSITION="right" ID="ID_1831737546" CREATED="1557085068928" MODIFIED="1557085074042">
<edge COLOR="#ff0000"/>
<node TEXT="sgf_file" ID="ID_1039764863" CREATED="1557085074727" MODIFIED="1557085081961"/>
<node TEXT="sgf_string" ID="ID_989102220" CREATED="1557085147666" MODIFIED="1557085194710"/>
<node TEXT="ogs_link" ID="ID_1282616712" CREATED="1557085082272" MODIFIED="1557085160093"/>
</node>
<node TEXT="download" POSITION="right" ID="ID_1873904492" CREATED="1557085133530" MODIFIED="1557085136492">
<edge COLOR="#0000ff"/>
<node TEXT="sgf_file" ID="ID_1595185954" CREATED="1557085138273" MODIFIED="1557085143950"/>
<node TEXT="sgf_string" ID="ID_719820272" CREATED="1557085170930" MODIFIED="1557085198846"/>
<node TEXT="win_rate" ID="ID_1382339492" CREATED="1557085790278" MODIFIED="1557085793056"/>
</node>
<node TEXT="game" POSITION="right" ID="ID_1853707191" CREATED="1557085213435" MODIFIED="1557085323151">
<edge COLOR="#00ff00"/>
<node TEXT="list_all" ID="ID_831796552" CREATED="1557085215931" MODIFIED="1557085330633"/>
<node TEXT="details" ID="ID_442193816" CREATED="1557085222491" MODIFIED="1557085340376"/>
<node TEXT="delete" ID="ID_1295768095" CREATED="1557085569047" MODIFIED="1557085573809"/>
<node TEXT="update" ID="ID_1105595237" CREATED="1557085595349" MODIFIED="1557085597064"/>
</node>
<node TEXT="go_game" POSITION="left" ID="ID_684286583" CREATED="1557085386711" MODIFIED="1557085392130">
<edge COLOR="#ff00ff"/>
<node TEXT="name" ID="ID_297122714" CREATED="1557085434085" MODIFIED="1557085435310"/>
<node TEXT="sgf_orig" ID="ID_1169920154" CREATED="1557085397151" MODIFIED="1557085543411"/>
<node TEXT="sgf_analysed" ID="ID_931193610" CREATED="1557085543744" MODIFIED="1557085551027"/>
<node TEXT="win_rate []" ID="ID_1454023457" CREATED="1557085683921" MODIFIED="1557085726931">
<node TEXT="move" ID="ID_620373457" CREATED="1557085727560" MODIFIED="1557085734946"/>
<node TEXT="win_rate_black" ID="ID_1201810077" CREATED="1557085735208" MODIFIED="1557085763121"/>
</node>
<node TEXT="status" ID="ID_1749576803" CREATED="1557085399079" MODIFIED="1557085400122">
<node TEXT="is_finished" ID="ID_446846876" CREATED="1557085494947" MODIFIED="1557085654689"/>
<node TEXT="is_running" ID="ID_1939121792" CREATED="1557085524753" MODIFIED="1557085530332"/>
</node>
</node>
</node>
</map>
