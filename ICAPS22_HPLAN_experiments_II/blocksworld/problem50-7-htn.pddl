( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b902 - block
    b771 - block
    b223 - block
    b93 - block
    b57 - block
    b665 - block
    b786 - block
    b346 - block
    b985 - block
    b14 - block
    b177 - block
    b960 - block
    b302 - block
    b209 - block
    b999 - block
    b244 - block
    b558 - block
    b436 - block
    b426 - block
    b203 - block
    b566 - block
    b660 - block
    b669 - block
    b328 - block
    b354 - block
    b453 - block
    b216 - block
    b634 - block
    b85 - block
    b973 - block
    b175 - block
    b778 - block
    b685 - block
    b105 - block
    b20 - block
    b736 - block
    b854 - block
    b115 - block
    b575 - block
    b340 - block
    b807 - block
    b831 - block
    b643 - block
    b515 - block
    b259 - block
    b315 - block
    b626 - block
    b963 - block
    b17 - block
    b850 - block
    b92 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b902 )
    ( on b771 b902 )
    ( on b223 b771 )
    ( on b93 b223 )
    ( on b57 b93 )
    ( on b665 b57 )
    ( on b786 b665 )
    ( on b346 b786 )
    ( on b985 b346 )
    ( on b14 b985 )
    ( on b177 b14 )
    ( on b960 b177 )
    ( on b302 b960 )
    ( on b209 b302 )
    ( on b999 b209 )
    ( on b244 b999 )
    ( on b558 b244 )
    ( on b436 b558 )
    ( on b426 b436 )
    ( on b203 b426 )
    ( on b566 b203 )
    ( on b660 b566 )
    ( on b669 b660 )
    ( on b328 b669 )
    ( on b354 b328 )
    ( on b453 b354 )
    ( on b216 b453 )
    ( on b634 b216 )
    ( on b85 b634 )
    ( on b973 b85 )
    ( on b175 b973 )
    ( on b778 b175 )
    ( on b685 b778 )
    ( on b105 b685 )
    ( on b20 b105 )
    ( on b736 b20 )
    ( on b854 b736 )
    ( on b115 b854 )
    ( on b575 b115 )
    ( on b340 b575 )
    ( on b807 b340 )
    ( on b831 b807 )
    ( on b643 b831 )
    ( on b515 b643 )
    ( on b259 b515 )
    ( on b315 b259 )
    ( on b626 b315 )
    ( on b963 b626 )
    ( on b17 b963 )
    ( on b850 b17 )
    ( on b92 b850 )
    ( clear b92 )
  )
  ( :tasks
    ( Make-50Pile b771 b223 b93 b57 b665 b786 b346 b985 b14 b177 b960 b302 b209 b999 b244 b558 b436 b426 b203 b566 b660 b669 b328 b354 b453 b216 b634 b85 b973 b175 b778 b685 b105 b20 b736 b854 b115 b575 b340 b807 b831 b643 b515 b259 b315 b626 b963 b17 b850 b92 )
  )
)
