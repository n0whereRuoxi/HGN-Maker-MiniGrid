( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b267 - block
    b629 - block
    b96 - block
    b244 - block
    b463 - block
    b250 - block
    b765 - block
    b638 - block
    b617 - block
    b319 - block
    b986 - block
    b793 - block
    b487 - block
    b128 - block
    b320 - block
    b862 - block
    b270 - block
    b965 - block
    b21 - block
    b488 - block
    b570 - block
    b154 - block
    b121 - block
    b70 - block
    b990 - block
    b468 - block
    b714 - block
    b259 - block
    b897 - block
    b890 - block
    b931 - block
    b327 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b267 )
    ( on b629 b267 )
    ( on b96 b629 )
    ( on b244 b96 )
    ( on b463 b244 )
    ( on b250 b463 )
    ( on b765 b250 )
    ( on b638 b765 )
    ( on b617 b638 )
    ( on b319 b617 )
    ( on b986 b319 )
    ( on b793 b986 )
    ( on b487 b793 )
    ( on b128 b487 )
    ( on b320 b128 )
    ( on b862 b320 )
    ( on b270 b862 )
    ( on b965 b270 )
    ( on b21 b965 )
    ( on b488 b21 )
    ( on b570 b488 )
    ( on b154 b570 )
    ( on b121 b154 )
    ( on b70 b121 )
    ( on b990 b70 )
    ( on b468 b990 )
    ( on b714 b468 )
    ( on b259 b714 )
    ( on b897 b259 )
    ( on b890 b897 )
    ( on b931 b890 )
    ( on b327 b931 )
    ( clear b327 )
  )
  ( :goal
    ( and
      ( clear b267 )
    )
  )
)
