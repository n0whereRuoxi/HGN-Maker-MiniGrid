( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b463 - block
    b332 - block
    b122 - block
    b928 - block
    b7 - block
    b261 - block
    b427 - block
    b219 - block
    b438 - block
    b628 - block
    b314 - block
    b239 - block
    b350 - block
    b33 - block
    b104 - block
    b738 - block
    b247 - block
    b857 - block
    b982 - block
    b586 - block
    b552 - block
    b398 - block
    b944 - block
    b316 - block
    b644 - block
    b708 - block
    b72 - block
    b70 - block
    b107 - block
    b475 - block
    b876 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b463 )
    ( on b332 b463 )
    ( on b122 b332 )
    ( on b928 b122 )
    ( on b7 b928 )
    ( on b261 b7 )
    ( on b427 b261 )
    ( on b219 b427 )
    ( on b438 b219 )
    ( on b628 b438 )
    ( on b314 b628 )
    ( on b239 b314 )
    ( on b350 b239 )
    ( on b33 b350 )
    ( on b104 b33 )
    ( on b738 b104 )
    ( on b247 b738 )
    ( on b857 b247 )
    ( on b982 b857 )
    ( on b586 b982 )
    ( on b552 b586 )
    ( on b398 b552 )
    ( on b944 b398 )
    ( on b316 b944 )
    ( on b644 b316 )
    ( on b708 b644 )
    ( on b72 b708 )
    ( on b70 b72 )
    ( on b107 b70 )
    ( on b475 b107 )
    ( on b876 b475 )
    ( clear b876 )
  )
  ( :goal
    ( and
      ( clear b463 )
    )
  )
)
