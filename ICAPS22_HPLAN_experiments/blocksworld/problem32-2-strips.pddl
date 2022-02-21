( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b278 - block
    b27 - block
    b807 - block
    b979 - block
    b899 - block
    b937 - block
    b304 - block
    b585 - block
    b258 - block
    b176 - block
    b465 - block
    b549 - block
    b548 - block
    b604 - block
    b19 - block
    b410 - block
    b134 - block
    b959 - block
    b804 - block
    b282 - block
    b209 - block
    b611 - block
    b335 - block
    b895 - block
    b852 - block
    b669 - block
    b322 - block
    b969 - block
    b540 - block
    b74 - block
    b936 - block
    b932 - block
    b562 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b278 )
    ( on b27 b278 )
    ( on b807 b27 )
    ( on b979 b807 )
    ( on b899 b979 )
    ( on b937 b899 )
    ( on b304 b937 )
    ( on b585 b304 )
    ( on b258 b585 )
    ( on b176 b258 )
    ( on b465 b176 )
    ( on b549 b465 )
    ( on b548 b549 )
    ( on b604 b548 )
    ( on b19 b604 )
    ( on b410 b19 )
    ( on b134 b410 )
    ( on b959 b134 )
    ( on b804 b959 )
    ( on b282 b804 )
    ( on b209 b282 )
    ( on b611 b209 )
    ( on b335 b611 )
    ( on b895 b335 )
    ( on b852 b895 )
    ( on b669 b852 )
    ( on b322 b669 )
    ( on b969 b322 )
    ( on b540 b969 )
    ( on b74 b540 )
    ( on b936 b74 )
    ( on b932 b936 )
    ( on b562 b932 )
    ( clear b562 )
  )
  ( :goal
    ( and
      ( clear b278 )
    )
  )
)
