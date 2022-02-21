( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b98 - block
    b304 - block
    b200 - block
    b821 - block
    b626 - block
    b483 - block
    b297 - block
    b616 - block
    b963 - block
    b391 - block
    b744 - block
    b170 - block
    b775 - block
    b398 - block
    b444 - block
    b221 - block
    b243 - block
    b254 - block
    b685 - block
    b203 - block
    b574 - block
    b332 - block
    b395 - block
    b268 - block
    b367 - block
    b265 - block
    b992 - block
    b956 - block
    b879 - block
    b546 - block
    b510 - block
    b996 - block
    b132 - block
    b289 - block
    b101 - block
    b404 - block
    b926 - block
    b500 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b98 )
    ( on b304 b98 )
    ( on b200 b304 )
    ( on b821 b200 )
    ( on b626 b821 )
    ( on b483 b626 )
    ( on b297 b483 )
    ( on b616 b297 )
    ( on b963 b616 )
    ( on b391 b963 )
    ( on b744 b391 )
    ( on b170 b744 )
    ( on b775 b170 )
    ( on b398 b775 )
    ( on b444 b398 )
    ( on b221 b444 )
    ( on b243 b221 )
    ( on b254 b243 )
    ( on b685 b254 )
    ( on b203 b685 )
    ( on b574 b203 )
    ( on b332 b574 )
    ( on b395 b332 )
    ( on b268 b395 )
    ( on b367 b268 )
    ( on b265 b367 )
    ( on b992 b265 )
    ( on b956 b992 )
    ( on b879 b956 )
    ( on b546 b879 )
    ( on b510 b546 )
    ( on b996 b510 )
    ( on b132 b996 )
    ( on b289 b132 )
    ( on b101 b289 )
    ( on b404 b101 )
    ( on b926 b404 )
    ( on b500 b926 )
    ( clear b500 )
  )
  ( :goal
    ( and
      ( clear b98 )
    )
  )
)
