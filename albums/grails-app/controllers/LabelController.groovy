            
class LabelController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ labelList: Label.list( params ) ]
    }

    def show = {
        def label = Label.get( params.id )

        if(!label) {
            flash.message = "Label not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ label : label ] }
    }

    def delete = {
        def label = Label.get( params.id )
        if(label) {
            label.delete()
            flash.message = "Label ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Label not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def label = Label.get( params.id )

        if(!label) {
            flash.message = "Label not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ label : label ]
        }
    }

    def update = {
        def label = Label.get( params.id )
        if(label) {
            label.properties = params
            if(!label.hasErrors() && label.save()) {
                flash.message = "Label ${params.id} updated"
                redirect(action:show,id:label.id)
            }
            else {
                render(view:'edit',model:[label:label])
            }
        }
        else {
            flash.message = "Label not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def label = new Label()
        label.properties = params
        return ['label':label]
    }

    def save = {
        def label = new Label(params)
        if(!label.hasErrors() && label.save()) {
            flash.message = "Label ${label.id} created"
            redirect(action:show,id:label.id)
        }
        else {
            render(view:'create',model:[label:label])
        }
    }
}