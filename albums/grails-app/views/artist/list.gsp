

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Artist List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Artist</g:link></span>
        </div>
        <div class="body">
            <h1>Artist List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artistList}" status="i" var="artist">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
<g:link action="showTheArtist" 
        params="[artistName:artist.name?.encodeAsArtistName()]">
${artist.id?.encodeAsHTML()}</g:link>


</td>
                        
                            <td>${artist.name?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Artist.count()}" />
            </div>
        </div>
    </body>
</html>
