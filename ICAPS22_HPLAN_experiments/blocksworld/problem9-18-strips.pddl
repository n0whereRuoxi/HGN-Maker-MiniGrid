( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b943 - block
    b417 - block
    b689 - block
    b135 - block
    b277 - block
    b618 - block
    b624 - block
    b863 - block
    b923 - block
    b181 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b943 )
    ( on b417 b943 )
    ( on b689 b417 )
    ( on b135 b689 )
    ( on b277 b135 )
    ( on b618 b277 )
    ( on b624 b618 )
    ( on b863 b624 )
    ( on b923 b863 )
    ( on b181 b923 )
    ( clear b181 )
  )
  ( :goal
    ( and
      ( clear b943 )
    )
  )
)
