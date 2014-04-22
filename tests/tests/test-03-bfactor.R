context('bfactor')

test_that('dich data', {
    key <- c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5)
    data <- key2binary(SAT12, key)
    specific <- c(2,3,2,3,3,2,1,2,1,1,1,3,1,3,1,2,1,1,3,3,1,1,3,1,3,3,1,3,2,3,1,2)
    mod1 <- bfactor(data, specific, verbose=FALSE, SE = TRUE, SE.type = 'crossprod')
    expect_is(mod1, 'ConfirmatoryClass')
    expect_equal(mod1@df, 4294967199)
    cfs <- do.call(c, coef(mod1, digits=4))
    cfs <- as.numeric(na.omit(cfs[cfs != 0 & cfs != 1]))
    expect_equal(cfs, c(0.7861, 0.5159, 1.0563, 0.4426, 0.0102, 0.875, -1.0729, -1.3116, -0.8343, 1.4909, 1.066, 1.9157, 0.8135, 0.3039, 1.3231, 0.471, 0.1911, 0.7509, 1.1476, 0.8265, 1.4687, -0.1526, -0.5584, 0.2532, -1.1727, -1.4361, -0.9093, 0.5277, 0.296, 0.7595, 0.5813, 0.1573, 1.0053, -0.5576, -0.7686, -0.3465, 0.968, 0.6684, 1.2677, 0.5136, 0.0972, 0.9299, 0.6283, 0.3893, 0.8672, 1.1389, 0.8043, 1.4734, 0.5835, 0.0236, 1.1435, -2.1287, -2.5185, -1.7389, 1.0383, 0.6538, 1.4228, 0.9505, 0.3252, 1.5758, 1.5624, 1.1836, 1.9412, 0.6731, 0.3993, 0.9468, 0.524, 0.0133, 1.0347, -1.57, -1.8547, -1.2853, 0.4473, 0.051, 0.8437, 1.0716, 0.2209, 1.9223, 2.4985, 1.8584, 3.1386, 1.0389, 0.7071, 1.3706, 0.8009, 0.2857, 1.316, -0.4025, -0.6423, -0.1626, 1.5827, 0.1568, 3.0087, 0.8549, -0.9418, 2.6517, 5.4019, 3.4336, 7.3702, 0.1221, -0.0922, 0.3364, 0.2729, -0.0654, 0.6113, -0.3504, -0.532, -0.1689, 1.0958, 0.7507, 1.4409, 0.5884, 0.1265, 1.0502, 0.8847, 0.629, 1.1404, 1.0908, 0.6922, 1.4894, 1.034, 0.4259, 1.642, 1.3605, 1.0081, 1.713, 1.3277, 0.9036, 1.7518, 0.5674, 0.0418, 1.0931, 2.0162, 1.6303, 2.4022, 0.7375, 0.4793, 0.9957, 0.3912, 0.0054, 0.777, -0.3909, -0.5967, -0.185, 1.5223, 0.7735, 2.271, 0.3034, -0.545, 1.1518, 4.1836, 3.3304, 5.0369, 1.7575, 1.3192, 2.1959, 0.1929, -0.3447, 0.7304, -0.8748, -1.1651, -0.5845, 0.8645, 0.5785, 1.1506, 0.0331, -0.3091, 0.3754, 0.2388, 0.0304, 0.4472, 1.5332, 0.9808, 2.0856, 0.4104, -0.1434, 0.9642, 2.6505, 2.1186, 3.1823, 0.5263, 0.0806, 0.9721, 0.6773, -0.1142, 1.4687, 2.6609, 2.1603, 3.1615, 1.6737, 0.8655, 2.4818, -0.0344, -0.7411, 0.6722, 3.6147, 2.7752, 4.4542, 0.6087, 0.3653, 0.8522, 0.4945, 0.0858, 0.9031, -0.8815, -1.1074, -0.6556, 1.2319, 0.8525, 1.6114, 0.2423, -0.1535, 0.6382, 1.2882, 1.0023, 1.5741, 0.7354, 0.476, 0.9947, 0.6426, 0.2139, 1.0712, -0.5995, -0.8249, -0.3742, 1.4898, 1.0991, 1.8806, 0.4859, 0.0468, 0.9251, -0.1725, -0.4279, 0.0828, 1.9058, 1.3075, 2.504, 0.415, -0.169, 0.9991, 2.8064, 2.2378, 3.375, 1.0572, 0.761, 1.3534, 0.149, -0.2358, 0.5338, 0.1725, -0.0414, 0.3863, 1.2276, 0.0476, 2.4075, 2.0402, -1.1072, 5.1875, -1.1821, -2.307, -0.0571, 0.4342, 0.1946, 0.6738, -0.1733, -0.5266, 0.1801, -0.2521, -0.4383, -0.0658, 2.5816, 1.5551, 3.6081, -0.235, -0.9097, 0.4398, 2.9944, 2.0731, 3.9156, 0.1326, -0.1185, 0.3838, 0.0294, -0.3714, 0.4302, -1.6521, -1.8929, -1.4113),
                 tolerance = 1e-2)
    fs <- fscores(mod1, verbose = FALSE)
    expect_is(fs, 'matrix')
    expect_true(mirt:::closeEnough(fs[1:6,'F1'] - c(-0.63861476, -0.07471563, -1.91230226,
                                                    -1.99390197, -2.00031725, -1.91345332), -1e-2, 1e-2))
    cof <- coef(mod1, verbose = FALSE)
    expect_is(cof, 'list')
    sum <- summary(mod1, verbose = FALSE)
    expect_is(sum, 'list')
#     fit <- fitIndices(mod1)
#     expect_equal(fit$M2, 6772.915, tolerance = 1e-2)
#     expect_equal(fit$df.M2, 432, tolerance = 1e-2)
    pfit1 <- personfit(mod1)
    expect_is(pfit1, 'data.frame')
    ifit <- itemfit(mod1)
    expect_is(ifit, 'data.frame')
    
    #nestlogit
    scoredSAT12 <- data
    scoredSAT12[,1:5] <- as.matrix(SAT12[,1:5])
    nestmod <- mirt(scoredSAT12, 1, c(rep('2PLNRM',5),rep('2PL', 27)), key=key, verbose=FALSE)
    cfs <- as.numeric(do.call(c, coef(nestmod, digits=4)))
    cfs <- cfs[cfs != 0 & cfs != 1]
    expect_equal(cfs, c(0.7928, -1.0428, -0.5715, -0.5787, -3.1137, 1.4113, 0.2128, 0.07, -5.4259, -5.7802, 1.5217, 0.4431, -0.919, -0.4077, -0.2366, -1.6949, -2.9472, -1.3499, -0.6444, -6.4068, 1.063, -1.1381, 0.1255, -0.1845, -0.3254, -0.2015, 0.1254, 0.4052, -0.6207, -2.5713, 0.5877, -0.5306, 0.0333, -0.0066, 0.1137, -1.1324, -0.0994, 0.0382, -0.2306, -3.6532, 0.983, 0.605, 0.4158, 0.0505, -0.0696, -1.3233, 0.6194, 0.0295, -0.7007, -5.3263, 1.1315, -2.04, 1.0201, 1.3905, 0.7031, -1.5122, 0.5175, 2.1378, 0.9976, -0.3594, 1.7057, 5.2077, 0.1694, -0.3456, 1.0861, 0.847, 1.0424, 1.177, 1.327, 1.9449, 0.7268, -0.3816, 1.4883, 4.0989, 1.6847, -0.8479, 0.8226, 0.2359, 1.5806, 2.6433, 0.6012, 2.5153, 1.5424, 3.4789, 0.649, -0.8519, 1.2108, 1.2726, 0.7751, -0.567, 1.5423, -0.17, 1.8603, 2.7282, 1.076, 0.1748, 0.8315, -0.7493, 0.3816, -0.2479, 2.3798, 2.8218, 0.1269, -1.6513),
                 tolerance = 1e-2)
    expect_equal(nestmod@logLik, -11715.17, tolerance = 1e-4)

    #simulate data
    set.seed(1234)
    a <- matrix(c(
        1,0.5,NA,
        1,0.5,NA,
        1,0.5,NA,
        1,0.5,NA,
        1,0.5,NA,
        1,0.5,NA,
        1,0.5,NA,
        1,NA,0.5,
        1,NA,0.5,
        1,NA,0.5,
        1,NA,0.5,
        1,NA,0.5,
        1,NA,0.5,
        1,NA,0.5),ncol=3,byrow=TRUE)

    d <- matrix(c(
        -1.0,NA,NA,
        -1.5,NA,NA,
        1.5,NA,NA,
        0.0,NA,NA,
        0.0,-1.0,1.5,
        0.0,2.0,-0.5,
        3.0,2.0,-0.5,
        3.0,2.0,-0.5,
        2.5,1.0,-1,
        2.0,0.0,NA,
        -1.0,NA,NA,
        -1.5,NA,NA,
        1.5,NA,NA,
        0.0,NA,NA),ncol=3,byrow=TRUE)

    nominal <- matrix(NA, nrow(d), ncol(d))
    nominal[5, ] <- c(0,1.2,2)
    sigma <- diag(3)
    set.seed(1234)
    items <- itemtype <- c(rep('dich', 4), 'nominal', 'gpcm', rep('graded',4),rep('dich', 4))
    dataset <- simdata(a,d,3000,itemtype, sigma=sigma, nominal=nominal)

    specific <- c(rep(1,7),rep(2,7))
    items[items == 'dich'] <- '2PL'
    simmod <- bfactor(dataset, specific, itemtype = items, verbose=FALSE)
    expect_is(simmod, 'ConfirmatoryClass')
    expect_equal(simmod@df, 442315)
    cfs <- as.numeric(do.call(c, coef(simmod, digits=4)))
    cfs <- cfs[cfs != 0 & cfs != 1]
    expect_equal(cfs, c(1.219, 0.5688, -1.0322, 1.0239, 0.0551, -1.4492, 1.1112, -0.3067, 1.5076, 1.2321, -0.4864, 0.0489, 1.1882, 0.0943, 1.4165, 2, -0.8873, 1.6079, 1.1425, 0.2036, 2, 2.0687, -0.4324, 1.1425, 0.3774, 3.0415, 2.0473, -0.5699, 0.8676, 0.8965, 3.0701, 2.039, -0.5565, 0.8515, 0.5159, 2.4812, 0.9452, -0.9526, 0.879, 0.8219, 2.2059, 0.0356, 0.794, 0.7967, -0.9985, 0.9118, 0.623, -1.3999, 0.9462, 0.6467, 1.5453, 0.9201, 0.6908, -0.0307),
                 tolerance = 1e-2)
    specific[1] <- NA
    simmod2 <- bfactor(dataset, specific, itemtype = items, verbose=FALSE)
    expect_is(simmod2, 'ConfirmatoryClass')
    expect_equal(simmod2@df, 442316)
    cfs <- as.numeric(do.call(c, coef(simmod2, digits=4)))
    cfs <- cfs[cfs != 0 & cfs != 1]
    expect_equal(cfs, c(1.1762, -0.9797, 1.0192, 0.1543, -1.4515, 1.0503, 0.3344, 1.485, 1.2114, 0.8021, 0.051, 1.1933, 0.0394, 1.4147, 2, -0.8852, 1.6098, 1.1494, 0.0068, 2, 2.0612, -0.4309, 1.2013, -0.2778, 3.0668, 2.0662, -0.575, 0.8699, 0.8924, 3.0688, 2.038, -0.5562, 0.8518, 0.5154, 2.4813, 0.9449, -0.9527, 0.8775, 0.824, 2.2063, 0.0357, 0.7912, 0.802, -0.9991, 0.9161, 0.6193, -1.4005, 0.9449, 0.6468, 1.5448, 0.9152, 0.6966, -0.0308),
                 tolerance = 1e-2)
    fs <- fscores(simmod, verbose = FALSE)
    expect_true(mirt:::closeEnough(fs[1:6,'F1'] - c(-2.637106, -2.327132, -2.414865,
                                                    -2.105639, -1.956874, -2.119947), -1e-2, 1e-2))
    expect_is(fs, 'matrix')

    res <- residuals(simmod, verbose = FALSE)
    expect_is(res, 'matrix')
    sum <- summary(simmod, verbose = FALSE)
    expect_is(sum, 'list')

    #two-tier
    set.seed(1234)
    a <- matrix(c(
        0,1,0.5,NA,NA,
        0,1,0.5,NA,NA,
        0,1,0.5,NA,NA,
        0,1,0.5,NA,NA,
        0,1,0.5,NA,NA,
        0,1,NA,0.5,NA,
        0,1,NA,0.5,NA,
        0,1,NA,0.5,NA,
        1,0,NA,0.5,NA,
        1,0,NA,0.5,NA,
        1,0,NA,0.5,NA,
        1,0,NA,NA,0.5,
        1,0,NA,NA,0.5,
        1,0,NA,NA,0.5,
        1,0,NA,NA,0.5,
        1,0,NA,NA,0.5),ncol=5,byrow=TRUE)
    
    d <- matrix(rnorm(16))
    items <- rep('dich', 16)
    
    sigma <- diag(5)
    sigma[1,2] <- sigma[2,1] <- .7
    dataset <- simdata(a,d,2000,itemtype=items,sigma=sigma)
    
    specific <- c(rep(1,5),rep(2,6),rep(3,5))
    model <- mirt.model('
        G1 = 1-8
        G2 = 9-16
        COV = G1*G2')
    
    simmod <- bfactor(dataset, specific, model, quadpts = 9, TOL = 1e-3, verbose=FALSE)
    expect_is(simmod, 'ConfirmatoryClass')
    expect_equal(simmod@df, 65486)
    cfs <- as.numeric(do.call(c, coef(simmod, digits=4)))
    cfs <- cfs[cfs != 0 & cfs != 1]
    expect_equal(cfs, c(1.1676, 0.0707, -1.1358, 0.9599, 0.8734, 0.2572, 1.4081, -0.094, 1.1603, 0.995, 0.3638, -2.2318, 1.1071, 0.2902, 0.474, 1.0824, 0.4672, 0.5874, 1.0401, 0.5948, -0.6579, 1.1344, 0.6779, -0.5169, 0.8959, 0.5099, -0.4837, 1.0979, 0.6283, -0.9717, 0.9903, 0.5833, -0.4863, 1.0698, 0.4347, -1.0032, 1.0424, 0.0972, -0.7258, 1.2091, 0.3615, 0.033, 0.9242, 0.4008, 0.8843, 0.9596, 0.6284, -0.0587, 0.6674),
                 tolerance = 1e-2)
    fs <- fscores(simmod, scores.only=T, returnER=TRUE)
    expect_equal(as.numeric(fs), c(0.7880284, 0.7752552, 0.2284767, 0.3235505, 0.1965711), tolerance = 1e-2)
})