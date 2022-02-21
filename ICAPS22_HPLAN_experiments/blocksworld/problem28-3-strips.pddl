( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b974 - block
    b418 - block
    b577 - block
    b34 - block
    b646 - block
    b479 - block
    b839 - block
    b587 - block
    b373 - block
    b675 - block
    b386 - block
    b966 - block
    b465 - block
    b108 - block
    b994 - block
    b151 - block
    b566 - block
    b623 - block
    b376 - block
    b818 - block
    b105 - block
    b639 - block
    b239 - block
    b143 - block
    b905 - block
    b306 - block
    b171 - block
    b397 - block
    b167 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b974 )
    ( on b418 b974 )
    ( on b577 b418 )
    ( on b34 b577 )
    ( on b646 b34 )
    ( on b479 b646 )
    ( on b839 b479 )
    ( on b587 b839 )
    ( on b373 b587 )
    ( on b675 b373 )
    ( on b386 b675 )
    ( on b966 b386 )
    ( on b465 b966 )
    ( on b108 b465 )
    ( on b994 b108 )
    ( on b151 b994 )
    ( on b566 b151 )
    ( on b623 b566 )
    ( on b376 b623 )
    ( on b818 b376 )
    ( on b105 b818 )
    ( on b639 b105 )
    ( on b239 b639 )
    ( on b143 b239 )
    ( on b905 b143 )
    ( on b306 b905 )
    ( on b171 b306 )
    ( on b397 b171 )
    ( on b167 b397 )
    ( clear b167 )
  )
  ( :goal
    ( and
      ( clear b974 )
    )
  )
)
