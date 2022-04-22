( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b330 - block
    b455 - block
    b809 - block
    b618 - block
    b107 - block
    b638 - block
    b664 - block
    b395 - block
    b823 - block
    b503 - block
    b637 - block
    b287 - block
    b779 - block
    b639 - block
    b130 - block
    b104 - block
    b445 - block
    b292 - block
    b222 - block
    b233 - block
    b133 - block
    b798 - block
    b19 - block
    b799 - block
    b324 - block
    b225 - block
    b234 - block
    b419 - block
    b72 - block
    b143 - block
    b500 - block
    b263 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b330 )
    ( on b455 b330 )
    ( on b809 b455 )
    ( on b618 b809 )
    ( on b107 b618 )
    ( on b638 b107 )
    ( on b664 b638 )
    ( on b395 b664 )
    ( on b823 b395 )
    ( on b503 b823 )
    ( on b637 b503 )
    ( on b287 b637 )
    ( on b779 b287 )
    ( on b639 b779 )
    ( on b130 b639 )
    ( on b104 b130 )
    ( on b445 b104 )
    ( on b292 b445 )
    ( on b222 b292 )
    ( on b233 b222 )
    ( on b133 b233 )
    ( on b798 b133 )
    ( on b19 b798 )
    ( on b799 b19 )
    ( on b324 b799 )
    ( on b225 b324 )
    ( on b234 b225 )
    ( on b419 b234 )
    ( on b72 b419 )
    ( on b143 b72 )
    ( on b500 b143 )
    ( on b263 b500 )
    ( clear b263 )
  )
  ( :goal
    ( and
      ( clear b330 )
    )
  )
)
