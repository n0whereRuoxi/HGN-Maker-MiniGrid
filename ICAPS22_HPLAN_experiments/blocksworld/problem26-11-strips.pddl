( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b579 - block
    b135 - block
    b819 - block
    b375 - block
    b69 - block
    b182 - block
    b467 - block
    b125 - block
    b622 - block
    b175 - block
    b32 - block
    b379 - block
    b996 - block
    b971 - block
    b698 - block
    b63 - block
    b256 - block
    b237 - block
    b187 - block
    b694 - block
    b176 - block
    b671 - block
    b532 - block
    b587 - block
    b552 - block
    b986 - block
    b795 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b579 )
    ( on b135 b579 )
    ( on b819 b135 )
    ( on b375 b819 )
    ( on b69 b375 )
    ( on b182 b69 )
    ( on b467 b182 )
    ( on b125 b467 )
    ( on b622 b125 )
    ( on b175 b622 )
    ( on b32 b175 )
    ( on b379 b32 )
    ( on b996 b379 )
    ( on b971 b996 )
    ( on b698 b971 )
    ( on b63 b698 )
    ( on b256 b63 )
    ( on b237 b256 )
    ( on b187 b237 )
    ( on b694 b187 )
    ( on b176 b694 )
    ( on b671 b176 )
    ( on b532 b671 )
    ( on b587 b532 )
    ( on b552 b587 )
    ( on b986 b552 )
    ( on b795 b986 )
    ( clear b795 )
  )
  ( :goal
    ( and
      ( clear b579 )
    )
  )
)
