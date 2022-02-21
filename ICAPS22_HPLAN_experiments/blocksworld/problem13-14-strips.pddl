( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b304 - block
    b593 - block
    b979 - block
    b761 - block
    b618 - block
    b145 - block
    b676 - block
    b246 - block
    b330 - block
    b299 - block
    b770 - block
    b135 - block
    b293 - block
    b995 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b304 )
    ( on b593 b304 )
    ( on b979 b593 )
    ( on b761 b979 )
    ( on b618 b761 )
    ( on b145 b618 )
    ( on b676 b145 )
    ( on b246 b676 )
    ( on b330 b246 )
    ( on b299 b330 )
    ( on b770 b299 )
    ( on b135 b770 )
    ( on b293 b135 )
    ( on b995 b293 )
    ( clear b995 )
  )
  ( :goal
    ( and
      ( clear b304 )
    )
  )
)
