( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b106 - block
    b716 - block
    b283 - block
    b621 - block
    b409 - block
    b846 - block
    b264 - block
    b467 - block
    b133 - block
    b41 - block
    b760 - block
    b863 - block
    b834 - block
    b954 - block
    b734 - block
    b186 - block
    b87 - block
    b202 - block
    b262 - block
    b856 - block
    b456 - block
    b162 - block
    b857 - block
    b372 - block
    b796 - block
    b7 - block
    b785 - block
    b484 - block
    b520 - block
    b85 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b106 )
    ( on b716 b106 )
    ( on b283 b716 )
    ( on b621 b283 )
    ( on b409 b621 )
    ( on b846 b409 )
    ( on b264 b846 )
    ( on b467 b264 )
    ( on b133 b467 )
    ( on b41 b133 )
    ( on b760 b41 )
    ( on b863 b760 )
    ( on b834 b863 )
    ( on b954 b834 )
    ( on b734 b954 )
    ( on b186 b734 )
    ( on b87 b186 )
    ( on b202 b87 )
    ( on b262 b202 )
    ( on b856 b262 )
    ( on b456 b856 )
    ( on b162 b456 )
    ( on b857 b162 )
    ( on b372 b857 )
    ( on b796 b372 )
    ( on b7 b796 )
    ( on b785 b7 )
    ( on b484 b785 )
    ( on b520 b484 )
    ( on b85 b520 )
    ( clear b85 )
  )
  ( :tasks
    ( Make-29Pile b716 b283 b621 b409 b846 b264 b467 b133 b41 b760 b863 b834 b954 b734 b186 b87 b202 b262 b856 b456 b162 b857 b372 b796 b7 b785 b484 b520 b85 )
  )
)
