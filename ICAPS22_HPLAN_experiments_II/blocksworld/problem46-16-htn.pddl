( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b121 - block
    b650 - block
    b277 - block
    b671 - block
    b614 - block
    b366 - block
    b426 - block
    b894 - block
    b169 - block
    b143 - block
    b514 - block
    b810 - block
    b838 - block
    b63 - block
    b752 - block
    b982 - block
    b335 - block
    b589 - block
    b890 - block
    b239 - block
    b438 - block
    b359 - block
    b491 - block
    b1 - block
    b51 - block
    b145 - block
    b689 - block
    b928 - block
    b685 - block
    b201 - block
    b393 - block
    b309 - block
    b512 - block
    b646 - block
    b786 - block
    b535 - block
    b746 - block
    b803 - block
    b792 - block
    b828 - block
    b351 - block
    b299 - block
    b396 - block
    b827 - block
    b627 - block
    b694 - block
    b569 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b121 )
    ( on b650 b121 )
    ( on b277 b650 )
    ( on b671 b277 )
    ( on b614 b671 )
    ( on b366 b614 )
    ( on b426 b366 )
    ( on b894 b426 )
    ( on b169 b894 )
    ( on b143 b169 )
    ( on b514 b143 )
    ( on b810 b514 )
    ( on b838 b810 )
    ( on b63 b838 )
    ( on b752 b63 )
    ( on b982 b752 )
    ( on b335 b982 )
    ( on b589 b335 )
    ( on b890 b589 )
    ( on b239 b890 )
    ( on b438 b239 )
    ( on b359 b438 )
    ( on b491 b359 )
    ( on b1 b491 )
    ( on b51 b1 )
    ( on b145 b51 )
    ( on b689 b145 )
    ( on b928 b689 )
    ( on b685 b928 )
    ( on b201 b685 )
    ( on b393 b201 )
    ( on b309 b393 )
    ( on b512 b309 )
    ( on b646 b512 )
    ( on b786 b646 )
    ( on b535 b786 )
    ( on b746 b535 )
    ( on b803 b746 )
    ( on b792 b803 )
    ( on b828 b792 )
    ( on b351 b828 )
    ( on b299 b351 )
    ( on b396 b299 )
    ( on b827 b396 )
    ( on b627 b827 )
    ( on b694 b627 )
    ( on b569 b694 )
    ( clear b569 )
  )
  ( :tasks
    ( Make-46Pile b650 b277 b671 b614 b366 b426 b894 b169 b143 b514 b810 b838 b63 b752 b982 b335 b589 b890 b239 b438 b359 b491 b1 b51 b145 b689 b928 b685 b201 b393 b309 b512 b646 b786 b535 b746 b803 b792 b828 b351 b299 b396 b827 b627 b694 b569 )
  )
)
