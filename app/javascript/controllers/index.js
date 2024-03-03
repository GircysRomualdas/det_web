
import { application } from "./application"

import DetailPrepsController from "./detail_preps_controller"
application.register("detail-preps", DetailPrepsController)

import FindDetailPrepsController from "./find_detail_preps_controller"
application.register("find-detail-preps", FindDetailPrepsController)


