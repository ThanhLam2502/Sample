import {Component, OnInit, ViewChild} from '@angular/core';
import {PartnerService} from '@app/modules/admin/services';
import {FilterPartnerModel, PartnerModel} from '@app/modules/admin/models/partner.model';
import {PopoverConfirmBoxComponent} from '@app/shared/components/popover-confirm-box/popover-confirm-box.component';
import {AppNotify} from '@app/utilities';
import DataSource from 'devextreme/data/data_source';
import {LoadParamModel} from '@app/modules/core/models';

@Component({
    selector: 'app-partners',
    templateUrl: './partners.component.html',
    styleUrls: ['./partners.component.scss']
})
export class PartnersComponent implements OnInit {
    @ViewChild('deleteDetailConfirmPopover', {static: true}) deleteDetailConfirmPopover: PopoverConfirmBoxComponent;
    filterPartner: FilterPartnerModel = new FilterPartnerModel();
    isProcessing: any;
    dataSource: DataSource;
    isOpenPartnerDetailPopup: boolean = false;
    selectedId: number;
    dataPartner: PartnerModel = new PartnerModel();
    constructor(private partnerService: PartnerService) {
    }

    ngOnInit() {
        this.loadPartners();
    }

    loadPartners() {
        this.dataSource = new DataSource({
            load: (loadOptions) => {
                const loadParams = new LoadParamModel(loadOptions, this.filterPartner);
                return this.partnerService.getPartners(loadParams).toPromise();
            }
        });
    }

    onSearchPartner(param: FilterPartnerModel) {
        this.filterPartner = param;
        this.loadPartners();
    }

    createPartner() {
        this.dataPartner = new PartnerModel();
        this.isOpenPartnerDetailPopup = true;
    }

    onPartnerDetail(param: PartnerModel) {
        this.dataPartner = param;
        this.isOpenPartnerDetailPopup = true;
    }

    onDeletePartner(id: any, e: MouseEvent) {
        this.selectedId = id;
        if (this.deleteDetailConfirmPopover) {
            this.deleteDetailConfirmPopover.show(e.currentTarget);
        }
    }

    onUpdatePartnerSuccess($event: any) {
        this.isOpenPartnerDetailPopup = false;
        this.loadPartners();
    }

    deletePartner() {
        this.isProcessing = true;
        this.partnerService.deletePartner(this.selectedId).subscribe(() => {
            AppNotify.success('Deleted success');
            this.loadPartners();
            this.isProcessing = false;
        }, (error) => {
            this.isProcessing = false;
        });
    }
}
