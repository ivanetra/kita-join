<?php

namespace App\Http\Controllers;
use DB;
use App\User;
use App\Post;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search_result($teamName)
    {
        if($teamName!=NULL){
            $searchResult = Post::where('post_name', 'LIKE', '%'.$teamName.'%')->get();
            $status="found";
            if($searchResult == "[]"){
                $searchResult = Post::All();
                $status="not found";
            }
        }else{
            $searchResult = Post::All();
            $status="empty name";
        }

        return response()->json(['status'=>$status,'searchResult'=>$searchResult]);
    }
    public function filter_result($category){
        if($category!=NULL){
            $filterResult = Post::where('category', $category)->get();
            $status="found";
            if($filterResult == "[]"){
                $filterResult = Post::All();
                $status="not found";
            }
        }else{
            $filterResult = Post::All();
            $status="empty name";
        }
        return response()->json(['status'=>$status,'searchResult'=>$filterResult]);
    }
}
