/*
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is part of dcm4che, an implementation of DICOM(TM) in
 * Java(TM), hosted at https://github.com/gunterze/dcm4che.
 *
 * The Initial Developer of the Original Code is
 * J4Care.
 * Portions created by the Initial Developer are Copyright (C) 2015-2019
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 * See @authors listed below
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 */

package org.dcm4chee.arc.export.rs;

import org.dcm4che3.net.service.QueryRetrieveLevel2;
import org.dcm4chee.arc.validation.constraints.InvokeValidate;

import javax.enterprise.context.RequestScoped;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;

/**
 * @author Gunter Zeilinger <gunterze@gmail.com>
 * @author Vrinda Nayak <vrinda.nayak@j4care.com>
 * @since Dec 2017
 */
@RequestScoped
@Path("aets/{AETitle}/rs")
@InvokeValidate(type = ExportMatchingRS.class)
public class ExportMatchingRS extends ExportMatching {
    @PathParam("AETitle")
    private String aet;

    @POST
    @Path("/studies/export/{ExporterID}")
    @Produces("application/json")
    public Response exportMatchingStudies(@PathParam("ExporterID") String exporterID) {
        return exportMatching(exporterID, aet,
                "exportMatchingStudies",
                QueryRetrieveLevel2.STUDY,
                null,
                null);
    }

    @POST
    @Path("/series/export/{ExporterID}")
    @Produces("application/json")
    public Response exportMatchingSeries(@PathParam("ExporterID") String exporterID) {
        return exportMatching(exporterID, aet,
                "exportMatchingSeries",
                QueryRetrieveLevel2.SERIES,
                null,
                null);
    }

    @POST
    @Path("/studies/{StudyInstanceUID}/series/export/{ExporterID}")
    @Produces("application/json")
    public Response exportMatchingSeriesOfStudy(
            @PathParam("ExporterID") String exporterID,
            @PathParam("StudyInstanceUID") String studyInstanceUID) {
        return exportMatching(exporterID, aet,
                "exportMatchingSeriesOfStudy",
                QueryRetrieveLevel2.SERIES,
                studyInstanceUID,
                null);
    }

    @POST
    @Path("/instances/export/{ExporterID}")
    @Produces("application/json")
    public Response exportMatchingInstances(@PathParam("ExporterID") String exporterID) {
        return exportMatching(exporterID, aet,
                "exportMatchingInstances",
                QueryRetrieveLevel2.IMAGE,
                null,
                null);
    }

    @POST
    @Path("/studies/{StudyInstanceUID}/instances/export/{ExporterID}")
    @Produces("application/json")
    public Response exportMatchingInstancesOfStudy(
            @PathParam("ExporterID") String exporterID,
            @PathParam("StudyInstanceUID") String studyInstanceUID) {
        return exportMatching(exporterID, aet,
                "exportMatchingInstancesOfStudy",
                QueryRetrieveLevel2.IMAGE, studyInstanceUID,
                null);
    }

    @Path("/studies/{StudyInstanceUID}/series/{SeriesInstanceUID}/instances/export/{ExporterID}")
    @Produces("application/json")
    public Response exportMatchingInstancesOfSeries(
            @PathParam("ExporterID") String exporterID,
            @PathParam("StudyInstanceUID") String studyInstanceUID,
            @PathParam("SeriesInstanceUID") String seriesInstanceUID) {
        return exportMatching(exporterID, aet,
                "exportMatchingInstancesOfSeries",
                QueryRetrieveLevel2.IMAGE,
                studyInstanceUID,
                seriesInstanceUID);
    }

}
