

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Album</title>
		<g:javascript library="prototype" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Album List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Album</g:link></span>
        </div>
        <div class="body">
            <h1>Show Album</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${album.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Artist:</td>
                            
                            <td valign="top" class="value"><g:link controller="artist" action="show" id="${album?.artist?.id}">${album?.artist}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${album.title}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tracks:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
<div id="tracksList">
  <g:render template="tracks" model="[theTracks:album.tracks]"/>                            
</div>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
<h3>Add Track</h3>
<g:formRemote name="addTrack" url="[action:'addTrack']" update="tracksList">
  <g:textField name="trackName" value=""/>
  <g:hiddenField name="albumId" value="${album.id}"/>
</g:formRemote>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${album?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
