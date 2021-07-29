SELECT		Businesses.Business,
			ISNULL(Premises.StreetNo,'') AS 'StreetNo',
			Premises.Street,
			Premises.PostCode,
			ISNULL(SUM(Count),0) AS 'FootfallCount'
FROM Footfall WITH (NOLOCK) 
RIGHT JOIN Premises WITH (NOLOCK) ON Footfall.PremisesId=Premises.Id
INNER JOIN Businesses WITH (NOLOCK) ON Premises.BusinessId= Businesses.Id
GROUP BY	PremisesId,
			Businesses.Business,
			Premises.StreetNo,
			Premises.Street,
			Premises.PostCode
