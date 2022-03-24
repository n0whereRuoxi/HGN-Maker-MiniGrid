( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b917 - block
    b161 - block
    b119 - block
    b197 - block
    b728 - block
    b260 - block
    b185 - block
    b232 - block
    b43 - block
    b309 - block
    b805 - block
    b406 - block
    b180 - block
    b857 - block
    b18 - block
    b652 - block
    b993 - block
    b545 - block
    b843 - block
    b263 - block
    b92 - block
    b24 - block
    b659 - block
    b298 - block
    b57 - block
    b714 - block
    b483 - block
    b154 - block
    b19 - block
    b556 - block
    b191 - block
    b98 - block
    b442 - block
    b971 - block
    b819 - block
    b764 - block
    b558 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b917 )
    ( on b161 b917 )
    ( on b119 b161 )
    ( on b197 b119 )
    ( on b728 b197 )
    ( on b260 b728 )
    ( on b185 b260 )
    ( on b232 b185 )
    ( on b43 b232 )
    ( on b309 b43 )
    ( on b805 b309 )
    ( on b406 b805 )
    ( on b180 b406 )
    ( on b857 b180 )
    ( on b18 b857 )
    ( on b652 b18 )
    ( on b993 b652 )
    ( on b545 b993 )
    ( on b843 b545 )
    ( on b263 b843 )
    ( on b92 b263 )
    ( on b24 b92 )
    ( on b659 b24 )
    ( on b298 b659 )
    ( on b57 b298 )
    ( on b714 b57 )
    ( on b483 b714 )
    ( on b154 b483 )
    ( on b19 b154 )
    ( on b556 b19 )
    ( on b191 b556 )
    ( on b98 b191 )
    ( on b442 b98 )
    ( on b971 b442 )
    ( on b819 b971 )
    ( on b764 b819 )
    ( on b558 b764 )
    ( clear b558 )
  )
  ( :goal
    ( and
      ( clear b917 )
    )
  )
)
