( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b380 - block
    b253 - block
    b22 - block
    b966 - block
    b654 - block
    b269 - block
    b835 - block
    b802 - block
    b571 - block
    b151 - block
    b101 - block
    b439 - block
    b304 - block
    b588 - block
    b341 - block
    b169 - block
    b148 - block
    b513 - block
    b86 - block
    b44 - block
    b660 - block
    b637 - block
    b902 - block
    b535 - block
    b568 - block
    b580 - block
    b609 - block
    b81 - block
    b756 - block
    b909 - block
    b973 - block
    b891 - block
    b883 - block
    b612 - block
    b254 - block
    b21 - block
    b779 - block
    b77 - block
    b308 - block
    b356 - block
    b106 - block
    b177 - block
    b873 - block
    b47 - block
    b688 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b380 )
    ( on b253 b380 )
    ( on b22 b253 )
    ( on b966 b22 )
    ( on b654 b966 )
    ( on b269 b654 )
    ( on b835 b269 )
    ( on b802 b835 )
    ( on b571 b802 )
    ( on b151 b571 )
    ( on b101 b151 )
    ( on b439 b101 )
    ( on b304 b439 )
    ( on b588 b304 )
    ( on b341 b588 )
    ( on b169 b341 )
    ( on b148 b169 )
    ( on b513 b148 )
    ( on b86 b513 )
    ( on b44 b86 )
    ( on b660 b44 )
    ( on b637 b660 )
    ( on b902 b637 )
    ( on b535 b902 )
    ( on b568 b535 )
    ( on b580 b568 )
    ( on b609 b580 )
    ( on b81 b609 )
    ( on b756 b81 )
    ( on b909 b756 )
    ( on b973 b909 )
    ( on b891 b973 )
    ( on b883 b891 )
    ( on b612 b883 )
    ( on b254 b612 )
    ( on b21 b254 )
    ( on b779 b21 )
    ( on b77 b779 )
    ( on b308 b77 )
    ( on b356 b308 )
    ( on b106 b356 )
    ( on b177 b106 )
    ( on b873 b177 )
    ( on b47 b873 )
    ( on b688 b47 )
    ( on b473 b688 )
    ( clear b473 )
  )
  ( :goal
    ( and
      ( clear b380 )
    )
  )
)
