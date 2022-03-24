( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b585 - block
    b351 - block
    b852 - block
    b422 - block
    b514 - block
    b881 - block
    b521 - block
    b757 - block
    b213 - block
    b9 - block
    b735 - block
    b110 - block
    b962 - block
    b801 - block
    b296 - block
    b579 - block
    b423 - block
    b507 - block
    b807 - block
    b990 - block
    b432 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b585 )
    ( on b351 b585 )
    ( on b852 b351 )
    ( on b422 b852 )
    ( on b514 b422 )
    ( on b881 b514 )
    ( on b521 b881 )
    ( on b757 b521 )
    ( on b213 b757 )
    ( on b9 b213 )
    ( on b735 b9 )
    ( on b110 b735 )
    ( on b962 b110 )
    ( on b801 b962 )
    ( on b296 b801 )
    ( on b579 b296 )
    ( on b423 b579 )
    ( on b507 b423 )
    ( on b807 b507 )
    ( on b990 b807 )
    ( on b432 b990 )
    ( clear b432 )
  )
  ( :tasks
    ( Make-20Pile b351 b852 b422 b514 b881 b521 b757 b213 b9 b735 b110 b962 b801 b296 b579 b423 b507 b807 b990 b432 )
  )
)
