<div style="display:flex;gap:25px;margin-bottom:15px;">

    <!-- Search -->
    <div>
        <label><b>Search:</b></label><br/>
        <input type="text" id="searchInput"
               placeholder="Search by title"
               onkeyup="applyFilters()"/>
    </div>

    <!-- Difficulty -->
    <div>
        <label><b>Difficulty:</b></label><br/>
        <select id="difficultyFilter" onchange="applyFilters()">
            <option value="">All</option>
            <option value="Easy">Easy</option>
            <option value="Medium">Medium</option>
            <option value="Hard">Hard</option>
        </select>
    </div>

    <!-- Tags -->
    <div>
        <label><b>Tags:</b></label><br/>
        <input type="text" id="tagFilter"
               placeholder="Array, Stack...."
               onkeyup="applyFilters()"/>
    </div>

</div>

<hr/>