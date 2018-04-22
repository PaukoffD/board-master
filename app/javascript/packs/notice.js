//require("notice")


import Vue from 'vue/dist/vue.esm'
import Notice from 'components/Notice'
Vue.component('Notice', Notice);

document.addEventListener('DOMContentLoaded', () => {
    let element = document.getElementById("notice-form");
    let notices = element.dataset.notices;
    console.log(notices);

    const app = new Vue({
        el: element,
        data: { notices: notices },
        template: '<Notice :notices="notices"/>',
        components: { Notice }
    })
})