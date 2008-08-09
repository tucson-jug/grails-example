

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Label</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Label List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Label</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Label</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${label}">
            <div class="errors">
                <g:renderErrors bean="${label}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${label?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="albums">Albums:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:label,field:'albums','errors')}">
                                    
<ul>
<g:each var="a" in="${label?.albums?}">
    <li><g:link controller="album" action="show" id="${a.id}">${a}</g:link></li>
</g:each>
</ul>
<g:link controller="album" params="["label.id":label?.id]" action="create">Add Album</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:label,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:label,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:label,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:label,field:'name')}"/>
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
