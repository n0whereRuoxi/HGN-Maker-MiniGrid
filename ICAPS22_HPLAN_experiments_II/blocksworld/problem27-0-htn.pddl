( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b227 - block
    b524 - block
    b594 - block
    b649 - block
    b203 - block
    b673 - block
    b807 - block
    b381 - block
    b869 - block
    b541 - block
    b935 - block
    b157 - block
    b346 - block
    b656 - block
    b42 - block
    b416 - block
    b801 - block
    b154 - block
    b467 - block
    b637 - block
    b641 - block
    b320 - block
    b768 - block
    b771 - block
    b324 - block
    b375 - block
    b159 - block
    b253 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b227 )
    ( on b524 b227 )
    ( on b594 b524 )
    ( on b649 b594 )
    ( on b203 b649 )
    ( on b673 b203 )
    ( on b807 b673 )
    ( on b381 b807 )
    ( on b869 b381 )
    ( on b541 b869 )
    ( on b935 b541 )
    ( on b157 b935 )
    ( on b346 b157 )
    ( on b656 b346 )
    ( on b42 b656 )
    ( on b416 b42 )
    ( on b801 b416 )
    ( on b154 b801 )
    ( on b467 b154 )
    ( on b637 b467 )
    ( on b641 b637 )
    ( on b320 b641 )
    ( on b768 b320 )
    ( on b771 b768 )
    ( on b324 b771 )
    ( on b375 b324 )
    ( on b159 b375 )
    ( on b253 b159 )
    ( clear b253 )
  )
  ( :tasks
    ( Make-27Pile b524 b594 b649 b203 b673 b807 b381 b869 b541 b935 b157 b346 b656 b42 b416 b801 b154 b467 b637 b641 b320 b768 b771 b324 b375 b159 b253 )
  )
)
