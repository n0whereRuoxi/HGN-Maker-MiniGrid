( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b655 - block
    b204 - block
    b823 - block
    b62 - block
    b933 - block
    b639 - block
    b629 - block
    b621 - block
    b819 - block
    b200 - block
    b705 - block
    b307 - block
    b170 - block
    b165 - block
    b245 - block
    b135 - block
    b783 - block
    b98 - block
    b524 - block
    b93 - block
    b304 - block
    b719 - block
    b263 - block
    b362 - block
    b761 - block
    b502 - block
    b633 - block
    b31 - block
    b285 - block
    b365 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b655 )
    ( on b204 b655 )
    ( on b823 b204 )
    ( on b62 b823 )
    ( on b933 b62 )
    ( on b639 b933 )
    ( on b629 b639 )
    ( on b621 b629 )
    ( on b819 b621 )
    ( on b200 b819 )
    ( on b705 b200 )
    ( on b307 b705 )
    ( on b170 b307 )
    ( on b165 b170 )
    ( on b245 b165 )
    ( on b135 b245 )
    ( on b783 b135 )
    ( on b98 b783 )
    ( on b524 b98 )
    ( on b93 b524 )
    ( on b304 b93 )
    ( on b719 b304 )
    ( on b263 b719 )
    ( on b362 b263 )
    ( on b761 b362 )
    ( on b502 b761 )
    ( on b633 b502 )
    ( on b31 b633 )
    ( on b285 b31 )
    ( on b365 b285 )
    ( clear b365 )
  )
  ( :goal
    ( and
      ( clear b655 )
    )
  )
)
