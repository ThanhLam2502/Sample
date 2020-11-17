import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {PartnerService} from '@app/modules/admin/services';
import {CategoryModel, OtherMessengerModel, PartnerModel} from '@app/modules/admin/models/partner.model';
import {VALIDATION_REGEX} from '@app/shared/constants';
import {AppNotify} from '@app/utilities';

@Component({
    selector: 'app-partners-detail',
    templateUrl: './partners-detail.component.html',
    styleUrls: ['./partners-detail.component.scss']
})
export class PartnersDetailComponent implements OnInit {
    private '_visible': boolean = false;
    //
    @Input() selectedPartner: PartnerModel = new PartnerModel();

    @Input()
    get visible(): boolean {
        return this._visible;
    }

    set visible(value: boolean) {
        this._visible = value;
        this.visibleChange.emit(value);
    }

    //
    @Output() visibleChange = new EventEmitter();
    @Output() onSuccess = new EventEmitter<PartnerModel>();
    //
    phoneRegex = VALIDATION_REGEX.phone;
    editingPartner: PartnerModel = new PartnerModel();
    otherMessengers: OtherMessengerModel[] = [];
    categoryModel: CategoryModel[] = [];

    constructor(private partnerService: PartnerService) {
    }

    ngOnInit() {
        if (this.selectedPartner.id) {
            this.partnerService.getPartnerById(this.selectedPartner.id).subscribe((result) => {
                this.editingPartner = result;
            });
        }

        this.partnerService.getOtherMessengers().subscribe((result) => {
            this.otherMessengers = result;
        });

        this.partnerService.getCategorys().subscribe((result) => {
            this.categoryModel = result;
        });
    }

    submitForm(param: any) {
        if (!param.validationGroup.validate().isValid) {
            return false;
        }
        this.partnerService.savePartner(this.editingPartner).subscribe((account) => {
            let message = 'Created success';
            if (this.editingPartner.id) {
                message = 'Updated success';
            }
            AppNotify.success(message);
            this.onSuccess.emit(this.editingPartner);
        }, (error) => {
        });
    }
}
