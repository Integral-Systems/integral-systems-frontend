import { browser } from "$app/env";
import { writable } from 'svelte/store'

export const toast = writable(
    {
        active: false, 
        type: '',
        message: ''
    }
)

export const cookieBanner = writable(false);
cookieBanner.subscribe(value => {
    if (browser) {
        if (!localStorage.cookieBanner) {
            localStorage.cookieBanner = true
            cookieBanner.set(true)
            console.log('No values in localStorage: ', value) 
        } else {
            if (!value) {
                localStorage.cookieBanner = false         
            }
        }
    }
});