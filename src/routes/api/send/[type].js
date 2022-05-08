import send from '$lib/server/send';
export async function post(req) {
    let response;
    if (req.params.type === 'mail') {
        response = send(req).then((value) => {
            console.log('Success: ', value)
            return {
                status: 200,
                body: {
                    message: 'Anfrage erfolgreich versandt!'
                }
            }
        })
        .catch((value) => {
            console.error('error: ', value)
            return {
                status: 500,
                body: {
                    message: 'Anfrage konnte nicht gesendet werden.',
                    error: value
                }
            }
        });
    } else {
        console.log('Not a valide endpoint!', req)
        return {
            status: 400,
            body: {
                message: 'Kein gültiger endpunkt gefunden.'
            }
        }
    }
    return response;
}



