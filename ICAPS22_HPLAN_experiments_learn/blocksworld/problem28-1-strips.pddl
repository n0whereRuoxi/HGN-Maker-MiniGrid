( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b422 - block
    b113 - block
    b165 - block
    b100 - block
    b187 - block
    b285 - block
    b920 - block
    b431 - block
    b359 - block
    b694 - block
    b670 - block
    b35 - block
    b271 - block
    b677 - block
    b602 - block
    b223 - block
    b753 - block
    b22 - block
    b661 - block
    b414 - block
    b517 - block
    b821 - block
    b536 - block
    b393 - block
    b444 - block
    b437 - block
    b545 - block
    b673 - block
    b67 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b422 )
    ( on b113 b422 )
    ( on b165 b113 )
    ( on b100 b165 )
    ( on b187 b100 )
    ( on b285 b187 )
    ( on b920 b285 )
    ( on b431 b920 )
    ( on b359 b431 )
    ( on b694 b359 )
    ( on b670 b694 )
    ( on b35 b670 )
    ( on b271 b35 )
    ( on b677 b271 )
    ( on b602 b677 )
    ( on b223 b602 )
    ( on b753 b223 )
    ( on b22 b753 )
    ( on b661 b22 )
    ( on b414 b661 )
    ( on b517 b414 )
    ( on b821 b517 )
    ( on b536 b821 )
    ( on b393 b536 )
    ( on b444 b393 )
    ( on b437 b444 )
    ( on b545 b437 )
    ( on b673 b545 )
    ( on b67 b673 )
    ( clear b67 )
  )
  ( :goal
    ( and
      ( clear b422 )
    )
  )
)
