SELECT SQ.Business,
		SQ.StreetNo,
		SQ.Street,
		SQ.Postcode,
		SUM(SQ.FootFallCount) TotalCount
FROM
(SELECT B.Business,
		p.Id,
		ISNULL(P.StreetNo,'') StreetNo,
		P.Street,
		P.Postcode,
		F.WeekNo,
		ISNULL(F.Count,0) FootFallCount
FROM Businesses B
INNER JOIN Premises P
ON B.Id = P.BusinessId
LEFT JOIN FootFall F
ON P.Id = F.PremisesId) SQ
GROUP BY SQ.Id, SQ.Business, SQ.StreetNo, SQ.Street, SQ.Postcode
