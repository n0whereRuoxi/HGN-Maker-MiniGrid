( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b363 - block
    b286 - block
    b910 - block
    b280 - block
    b901 - block
    b136 - block
    b579 - block
    b29 - block
    b832 - block
    b889 - block
    b51 - block
    b605 - block
    b637 - block
    b156 - block
    b39 - block
    b553 - block
    b767 - block
    b920 - block
    b909 - block
    b690 - block
    b753 - block
    b725 - block
    b697 - block
    b562 - block
    b185 - block
    b521 - block
    b543 - block
    b694 - block
    b807 - block
    b244 - block
    b242 - block
    b404 - block
    b376 - block
    b305 - block
    b366 - block
    b736 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b363 )
    ( on b286 b363 )
    ( on b910 b286 )
    ( on b280 b910 )
    ( on b901 b280 )
    ( on b136 b901 )
    ( on b579 b136 )
    ( on b29 b579 )
    ( on b832 b29 )
    ( on b889 b832 )
    ( on b51 b889 )
    ( on b605 b51 )
    ( on b637 b605 )
    ( on b156 b637 )
    ( on b39 b156 )
    ( on b553 b39 )
    ( on b767 b553 )
    ( on b920 b767 )
    ( on b909 b920 )
    ( on b690 b909 )
    ( on b753 b690 )
    ( on b725 b753 )
    ( on b697 b725 )
    ( on b562 b697 )
    ( on b185 b562 )
    ( on b521 b185 )
    ( on b543 b521 )
    ( on b694 b543 )
    ( on b807 b694 )
    ( on b244 b807 )
    ( on b242 b244 )
    ( on b404 b242 )
    ( on b376 b404 )
    ( on b305 b376 )
    ( on b366 b305 )
    ( on b736 b366 )
    ( clear b736 )
  )
  ( :tasks
    ( Make-35Pile b286 b910 b280 b901 b136 b579 b29 b832 b889 b51 b605 b637 b156 b39 b553 b767 b920 b909 b690 b753 b725 b697 b562 b185 b521 b543 b694 b807 b244 b242 b404 b376 b305 b366 b736 )
  )
)
