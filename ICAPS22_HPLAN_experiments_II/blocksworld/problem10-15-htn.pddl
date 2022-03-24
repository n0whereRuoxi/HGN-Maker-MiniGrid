( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b711 - block
    b68 - block
    b984 - block
    b203 - block
    b925 - block
    b685 - block
    b584 - block
    b467 - block
    b777 - block
    b715 - block
    b873 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b711 )
    ( on b68 b711 )
    ( on b984 b68 )
    ( on b203 b984 )
    ( on b925 b203 )
    ( on b685 b925 )
    ( on b584 b685 )
    ( on b467 b584 )
    ( on b777 b467 )
    ( on b715 b777 )
    ( on b873 b715 )
    ( clear b873 )
  )
  ( :tasks
    ( Make-10Pile b68 b984 b203 b925 b685 b584 b467 b777 b715 b873 )
  )
)
