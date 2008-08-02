

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Album</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Album List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Album</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Album</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${album}">
            <div class="errors">
                <g:renderErrors bean="${album}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${album?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artist">Artist:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:album,field:'artist','errors')}">
                                    <g:select optionKey="id" from="${Artist.list()}" name="artist.id" value="${album?.artist?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:album,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:album,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tracks">Tracks:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:album,field:'tracks','errors')}">
                                    
<ul>
<g:each var="t" in="${album?.tracks?}">
    <li><g:link controller="track" action="show" id="${t.id}">${t}</g:link></li>
</g:each>
</ul>
<g:link controller="track" params="["album.id":album?.id]" action="create">Add Track</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
