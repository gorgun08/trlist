import {
  generatePlayer,
  getSubdivisionFlag,
  populateSubdivisionDropdown,
} from "/static/demonlist/js/modules/demonlist.js";
import {
  displayError,
  Form,
  valueMissing,
  FilteredPaginator,
  setupFormDialogEditor,
  PaginatorEditorBackend,
  setupDropdownEditor,
  Viewer,
  get,
} from "/static/core/js/modules/form.js";
import { recordManager, initialize as initRecords } from "./records.js";
import { loadResource, tr } from "/static/core/js/modules/localization.js";

export let playerManager;

class PlayerManager extends FilteredPaginator {
  constructor() {
    super("player-pagination", generatePlayer, "name_contains");

    this.output = new Viewer(
      this.html.parentNode.getElementsByClassName("viewer-content")[0],
      this
    );

    this._id = document.getElementById("player-player-id");
    this._name = document.getElementById("player-player-name");

    this._banned = setupDropdownEditor(
      new PaginatorEditorBackend(this, true),
      "edit-player-banned",
      "banned",
      this.output,
      { true: true, false: false }
    );

    this._nationality = setupDropdownEditor(
      new PaginatorEditorBackend(this, true),
      "edit-player-nationality",
      "nationality",
      this.output,
      { None: null }
    );

    this._subdivision = setupDropdownEditor(
      new PaginatorEditorBackend(this, true),
      "edit-player-subdivision",
      "subdivision",
      this.output,
      { None: null }
    );

    this.initNameDialog();
  }

  onReceive(response) {
    super.onReceive(response);

    if (response.status == 204) {
      return;
    }

    this._id.innerText = this.currentObject.id;
    this._name.innerText = this.currentObject.name;

    this._banned.selectSilently(this.currentObject.banned.toString());

    if (this.currentObject.nationality) {
      this._nationality.selectSilently(
        this.currentObject.nationality.country_code
      );

      populateSubdivisionDropdown(
        this._subdivision,
        this.currentObject.nationality.country_code
      ).then(() => {
        if (!this.currentObject.nationality.subdivision) {
          this._subdivision.selectSilently(
            tr("demonlist", "player", "player-subdivision.none")
          );
        } else {
          this._subdivision.selectSilently(
            this.currentObject.nationality.subdivision.iso_code
          );
        }
      });
    } else {
      this._nationality.selectSilently(
        tr("demonlist", "player", "player-nationality.none")
      );
      this._subdivision.selectSilently(
        tr("demonlist", "player", "player-subdivision.none")
      );
    }
  }

  initNameDialog() {
    let form = setupFormDialogEditor(
      new PaginatorEditorBackend(this, true),
      "player-name-dialog",
      "player-name-pen",
      this.output
    );

    form.addValidators({
      "player-name-edit": {
        [tr(
          "demonlist",
          "player",
          "player-name-dialog.name-validator-valuemissing"
        )]: valueMissing,
      },
    });
  }
}

function setupPlayerSearchPlayerIdForm() {
  var playerSearchByIdForm = new Form(
    document.getElementById("player-search-by-player-id-form")
  );
  var playerId = playerSearchByIdForm.input("search-player-id");

  playerId.addValidator(
    valueMissing,
    tr("demonlist", "player", "player-idsearch-panel.id-validator-valuemissing")
  );
  playerSearchByIdForm.onSubmit(function () {
    playerManager
      .selectArbitrary(parseInt(playerId.value))
      .catch(displayError(playerSearchByIdForm));
  });
}

export function initialize(tabber) {
  setupPlayerSearchPlayerIdForm();

  playerManager = new PlayerManager();
  playerManager.initialize();

  document
    .getElementById("player-list-records")
    .addEventListener("click", () => {
      if (recordManager == null) {
        // Prevent race conditions between initialization request and the request caused by 'updateQueryData'
        initRecords().then(() => {
          recordManager.updateQueryData(
            "player",
            playerManager.currentObject.id
          );
          tabber.selectPane("3");
        });
      } else {
        recordManager.updateQueryData("player", playerManager.currentObject.id);
        tabber.selectPane("3"); // definitely initializes the record manager
      }
    });
}
