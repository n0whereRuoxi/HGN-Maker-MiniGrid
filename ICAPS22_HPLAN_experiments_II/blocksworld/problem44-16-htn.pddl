( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b653 - block
    b842 - block
    b22 - block
    b203 - block
    b648 - block
    b685 - block
    b309 - block
    b984 - block
    b635 - block
    b585 - block
    b455 - block
    b631 - block
    b654 - block
    b415 - block
    b808 - block
    b483 - block
    b552 - block
    b276 - block
    b375 - block
    b951 - block
    b578 - block
    b937 - block
    b315 - block
    b107 - block
    b147 - block
    b746 - block
    b865 - block
    b811 - block
    b331 - block
    b371 - block
    b625 - block
    b832 - block
    b118 - block
    b125 - block
    b852 - block
    b931 - block
    b85 - block
    b851 - block
    b285 - block
    b700 - block
    b59 - block
    b575 - block
    b227 - block
    b524 - block
    b853 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b653 )
    ( on b842 b653 )
    ( on b22 b842 )
    ( on b203 b22 )
    ( on b648 b203 )
    ( on b685 b648 )
    ( on b309 b685 )
    ( on b984 b309 )
    ( on b635 b984 )
    ( on b585 b635 )
    ( on b455 b585 )
    ( on b631 b455 )
    ( on b654 b631 )
    ( on b415 b654 )
    ( on b808 b415 )
    ( on b483 b808 )
    ( on b552 b483 )
    ( on b276 b552 )
    ( on b375 b276 )
    ( on b951 b375 )
    ( on b578 b951 )
    ( on b937 b578 )
    ( on b315 b937 )
    ( on b107 b315 )
    ( on b147 b107 )
    ( on b746 b147 )
    ( on b865 b746 )
    ( on b811 b865 )
    ( on b331 b811 )
    ( on b371 b331 )
    ( on b625 b371 )
    ( on b832 b625 )
    ( on b118 b832 )
    ( on b125 b118 )
    ( on b852 b125 )
    ( on b931 b852 )
    ( on b85 b931 )
    ( on b851 b85 )
    ( on b285 b851 )
    ( on b700 b285 )
    ( on b59 b700 )
    ( on b575 b59 )
    ( on b227 b575 )
    ( on b524 b227 )
    ( on b853 b524 )
    ( clear b853 )
  )
  ( :tasks
    ( Make-44Pile b842 b22 b203 b648 b685 b309 b984 b635 b585 b455 b631 b654 b415 b808 b483 b552 b276 b375 b951 b578 b937 b315 b107 b147 b746 b865 b811 b331 b371 b625 b832 b118 b125 b852 b931 b85 b851 b285 b700 b59 b575 b227 b524 b853 )
  )
)
