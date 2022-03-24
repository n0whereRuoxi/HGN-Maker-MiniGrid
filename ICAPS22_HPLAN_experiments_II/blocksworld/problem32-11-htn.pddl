( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b592 - block
    b865 - block
    b873 - block
    b613 - block
    b526 - block
    b809 - block
    b203 - block
    b180 - block
    b962 - block
    b508 - block
    b249 - block
    b22 - block
    b877 - block
    b953 - block
    b888 - block
    b524 - block
    b427 - block
    b798 - block
    b563 - block
    b15 - block
    b155 - block
    b136 - block
    b785 - block
    b323 - block
    b156 - block
    b577 - block
    b821 - block
    b518 - block
    b406 - block
    b343 - block
    b860 - block
    b322 - block
    b47 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b592 )
    ( on b865 b592 )
    ( on b873 b865 )
    ( on b613 b873 )
    ( on b526 b613 )
    ( on b809 b526 )
    ( on b203 b809 )
    ( on b180 b203 )
    ( on b962 b180 )
    ( on b508 b962 )
    ( on b249 b508 )
    ( on b22 b249 )
    ( on b877 b22 )
    ( on b953 b877 )
    ( on b888 b953 )
    ( on b524 b888 )
    ( on b427 b524 )
    ( on b798 b427 )
    ( on b563 b798 )
    ( on b15 b563 )
    ( on b155 b15 )
    ( on b136 b155 )
    ( on b785 b136 )
    ( on b323 b785 )
    ( on b156 b323 )
    ( on b577 b156 )
    ( on b821 b577 )
    ( on b518 b821 )
    ( on b406 b518 )
    ( on b343 b406 )
    ( on b860 b343 )
    ( on b322 b860 )
    ( on b47 b322 )
    ( clear b47 )
  )
  ( :tasks
    ( Make-32Pile b865 b873 b613 b526 b809 b203 b180 b962 b508 b249 b22 b877 b953 b888 b524 b427 b798 b563 b15 b155 b136 b785 b323 b156 b577 b821 b518 b406 b343 b860 b322 b47 )
  )
)
