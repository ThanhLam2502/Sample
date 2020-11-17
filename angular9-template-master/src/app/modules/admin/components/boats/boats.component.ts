import {Component, OnInit, ViewChild} from '@angular/core';
import DataSource from 'devextreme/data/data_source';
import {LoadParamModel} from '@app/modules/core/models';
import {BoatService} from '@app/modules/admin/services/boat.services';
import {FilterBoatModel} from '@app/modules/admin/models/boat.model';
import {PopoverConfirmBoxComponent} from '@app/shared/components';
import {AppNotify} from '@app/utilities';

@Component({
    selector: 'app-boats',
    templateUrl: './boats.component.html',
    styleUrls: ['./boats.component.scss']
})
export class BoatsComponent implements OnInit {
    @ViewChild('deleteDetailConfirmPopover') deleteDetailConfirmPopover: PopoverConfirmBoxComponent;
    isProcessing: any;
    dataSource: DataSource;
    isOpenBoatDetailPopup: any;
    dataBoat: any;
    filterBoat: FilterBoatModel = new FilterBoatModel();
    selectedId: number;
    constructor(private boatService: BoatService) {
    }

    ngOnInit() {
        this.loadBoats();
    }

    loadBoats() {
        this.dataSource = new DataSource({
            load: (loadOptions) => {
                const loadParams = new LoadParamModel(loadOptions, this.filterBoat);
                return this.boatService.getBoats(loadParams).toPromise();
            }
        });
    }

    onSearchBoat(filterBoat: any) {
        this.filterBoat = filterBoat;
        this.loadBoats();
    }

    createBoat() {
    }

    onBoatDetail(data: any) {
    }

    onDeleteBoat(id: any, e: MouseEvent) {
        this.selectedId = id;
        if (this.deleteDetailConfirmPopover) {
            this.deleteDetailConfirmPopover.show(e.currentTarget);
        }
    }

    onUpdateBoatSuccess($event: any) {

    }

    deleteBoat() {
        this.isProcessing = true;
        this.boatService.deleteBoat(this.selectedId).subscribe(() => {
            AppNotify.success('Deleted success');
            this.loadBoats();
            this.isProcessing = false;
        }, (error) => {
            AppNotify.error();
            this.isProcessing = false;
        });
    }
}
