( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b812 - block
    b723 - block
    b441 - block
    b507 - block
    b190 - block
    b939 - block
    b273 - block
    b837 - block
    b163 - block
    b195 - block
    b133 - block
    b500 - block
    b785 - block
    b310 - block
    b674 - block
    b540 - block
    b416 - block
    b754 - block
    b390 - block
    b930 - block
    b47 - block
    b521 - block
    b511 - block
    b515 - block
    b164 - block
    b19 - block
    b539 - block
    b805 - block
    b861 - block
    b748 - block
    b813 - block
    b526 - block
    b679 - block
    b525 - block
    b976 - block
    b870 - block
    b212 - block
    b704 - block
    b305 - block
    b402 - block
    b317 - block
    b607 - block
    b4 - block
    b908 - block
    b512 - block
    b698 - block
    b280 - block
    b983 - block
    b509 - block
    b841 - block
    b101 - block
    b369 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b812 )
    ( on b723 b812 )
    ( on b441 b723 )
    ( on b507 b441 )
    ( on b190 b507 )
    ( on b939 b190 )
    ( on b273 b939 )
    ( on b837 b273 )
    ( on b163 b837 )
    ( on b195 b163 )
    ( on b133 b195 )
    ( on b500 b133 )
    ( on b785 b500 )
    ( on b310 b785 )
    ( on b674 b310 )
    ( on b540 b674 )
    ( on b416 b540 )
    ( on b754 b416 )
    ( on b390 b754 )
    ( on b930 b390 )
    ( on b47 b930 )
    ( on b521 b47 )
    ( on b511 b521 )
    ( on b515 b511 )
    ( on b164 b515 )
    ( on b19 b164 )
    ( on b539 b19 )
    ( on b805 b539 )
    ( on b861 b805 )
    ( on b748 b861 )
    ( on b813 b748 )
    ( on b526 b813 )
    ( on b679 b526 )
    ( on b525 b679 )
    ( on b976 b525 )
    ( on b870 b976 )
    ( on b212 b870 )
    ( on b704 b212 )
    ( on b305 b704 )
    ( on b402 b305 )
    ( on b317 b402 )
    ( on b607 b317 )
    ( on b4 b607 )
    ( on b908 b4 )
    ( on b512 b908 )
    ( on b698 b512 )
    ( on b280 b698 )
    ( on b983 b280 )
    ( on b509 b983 )
    ( on b841 b509 )
    ( on b101 b841 )
    ( on b369 b101 )
    ( clear b369 )
  )
  ( :goal
    ( and
      ( clear b812 )
    )
  )
)
