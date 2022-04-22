( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b61 - block
    b385 - block
    b350 - block
    b353 - block
    b336 - block
    b151 - block
    b127 - block
    b682 - block
    b512 - block
    b21 - block
    b478 - block
    b356 - block
    b41 - block
    b786 - block
    b928 - block
    b605 - block
    b963 - block
    b215 - block
    b459 - block
    b46 - block
    b643 - block
    b106 - block
    b865 - block
    b540 - block
    b89 - block
    b791 - block
    b953 - block
    b433 - block
    b707 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b61 )
    ( on b385 b61 )
    ( on b350 b385 )
    ( on b353 b350 )
    ( on b336 b353 )
    ( on b151 b336 )
    ( on b127 b151 )
    ( on b682 b127 )
    ( on b512 b682 )
    ( on b21 b512 )
    ( on b478 b21 )
    ( on b356 b478 )
    ( on b41 b356 )
    ( on b786 b41 )
    ( on b928 b786 )
    ( on b605 b928 )
    ( on b963 b605 )
    ( on b215 b963 )
    ( on b459 b215 )
    ( on b46 b459 )
    ( on b643 b46 )
    ( on b106 b643 )
    ( on b865 b106 )
    ( on b540 b865 )
    ( on b89 b540 )
    ( on b791 b89 )
    ( on b953 b791 )
    ( on b433 b953 )
    ( on b707 b433 )
    ( clear b707 )
  )
  ( :goal
    ( and
      ( clear b61 )
    )
  )
)
