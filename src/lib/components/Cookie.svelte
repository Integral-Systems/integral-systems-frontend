<script>
    import { slide } from 'svelte/transition';
    import {cookieBanner} from '../../stores.js';
</script>
{#if $cookieBanner}
<div class="w-screen bg-cust-teal flex items-center justify-center px-5 py-5 fixed bottom-0" transition:slide>
    <section class="w-full p-5 lg:px-24 absolute bg-cust-teal">
        <div class="md:flex items-center -mx-3">
            <div class="md:flex-1 px-3 mb-5 md:mb-0">
                <p class="text-center md:text-left text-white text-xs leading-tight md:pr-12">{$cookieBanner} Wir und ausgewählte Partner und verbundene Unternehmen verwenden Cookies und ähnliche Technologien, wie in unserer Cookie-Richtlinie beschrieben. Sie erklären sich mit der Verwendung dieser Technologien einverstanden, indem Sie auf Akzeptieren klicken oder diese Website weiter besuchen. Sie können mehr darüber erfahren, wie wir Cookies verwenden und die Cookie-Präferenzen unter Einstellungen festlegen.</p>
            </div>
            <div class="px-3 text-center">
                <!--<button id="btn" class="py-2 px-8 bg-gray-800 hover:bg-gray-900 text-white rounded font-bold text-sm shadow-xl mr-3">Cookie settings</button>-->
                <button id="btn" class="py-2 px-8 bg-indigo-600 hover:bg-indigo-700 text-white rounded font-bold text-sm shadow-xl" on:click={() => cookieBanner.set(false)}>Accept cookies</button>
            </div>
        </div>
    </section>
    <!--
    <dialog id="cookiesModal" class="h-auto w-11/12 md:w-1/2 bg-white overflow-hidden rounded-md p-0">
        <div class="flex flex-col w-full h-auto">
            <div class="flex w-full h-auto items-center px-5 py-3">
                <div class="w-10/12 h-auto text-lg font-bold">
                    Cookie settings
                </div>
                <div class="flex w-2/12 h-auto justify-end">
                    <button class="cursor-pointer focus:outline-none text-gray-400 hover:text-gray-800">
                        <i class="mdi mdi-close-circle-outline text-2xl"></i>
                    </button>
                </div>
            </div>
            <div class="flex w-full items-center bg-gray-100 border-b border-gray-200 px-5 py-3 text-sm">
                <div class="flex-1">
                    <p>Strictly necessary cookies</p>
                </div>
                <div class="w-10 text-right">
                    <i class="mdi mdi-check-circle text-2xl text-green-400 leading-none"></i>
                </div>
            </div>
            <div class="flex w-full items-center bg-gray-100 border-b border-gray-200 px-5 py-3 text-sm">
                <div class="flex-1">
                    <p>Cookies that remember your settings</p>
                </div>
                <div class="w-10 text-right">
                    <i class="mdi mdi-check-circle text-2xl text-green-400 leading-none"></i>
                </div>
            </div>
            <div class="flex w-full items-center bg-gray-100 border-b border-gray-200 px-5 py-3 text-sm">
                <div class="flex-1">
                    <p>Cookies that measure website use</p>
                </div>
                <div class="w-10 text-right">
                    <i class="mdi mdi-check-circle text-2xl text-green-400 leading-none"></i>
                </div>
            </div>
            <div class="flex w-full items-center bg-gray-100 border-b border-gray-200 px-5 py-3 text-sm">
                <div class="flex-1">
                    <p>Cookies that help with our communications and marketing</p>
                </div>
                <div class="w-10 text-right">
                    <i class="mdi mdi-check-circle text-2xl text-green-400 leading-none"></i>
                </div>
            </div>
            <div class="flex w-full px-5 py-3 justify-end">
                <button class="py-2 px-8 bg-gray-800 hover:bg-gray-900 text-white rounded font-bold text-sm shadow-xl">Save settings</button>
            </div>
        </div>
    </dialog>
-->
</div>
{/if}

<style lang="scss" scoped>
section {
    top: -30px
}
@-webkit-keyframes fadeIn {
  from { opacity:0 }
  to { opacity:1 }
}
@keyframes fadeIn {
  from { opacity:0 }
  to { opacity:1 }
}
@-webkit-keyframes fadeInUp {
  from { opacity:0; transform:translate3d(0,10%,0) }
  to { opacity:1; transform:translate3d(0,0,0) }
}
@keyframes fadeInUp {
  from { opacity:0; transform:translate3d(0,10%,0) }
  to { opacity:1; transform:translate3d(0,0,0) }
}

dialog[open] { -webkit-animation-duration:0.3s; animation-duration:0.3s; -webkit-animation-fill-mode:both; animation-fill-mode:both; -webkit-animation-name:fadeInUp; animation-name:fadeInUp }
dialog::backdrop { background: rgba(0, 0, 0, 0.3); backdrop-filter: blur(3px); -webkit-animation-duration:0.3s; animation-duration:0.3s; -webkit-animation-fill-mode:both; animation-fill-mode:both; -webkit-animation-name:fadeIn; animation-name:fadeIn  }
</style>